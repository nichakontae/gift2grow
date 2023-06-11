import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/tracking.dart';
import 'package:gift2grow/utilities/notification/notify_user.dart';
import 'package:gift2grow/widgets/theme_button.dart';

import '../utilities/caller.dart';

class AddTracking extends StatefulWidget {
  final int campaignId;
  final String userId;

  const AddTracking({
    super.key,
    required this.campaignId,
    required this.userId,
  });

  @override
  State<AddTracking> createState() => _AddTrackingState();
}

class _AddTrackingState extends State<AddTracking> {
  late Tracking tracking;

  final _formkey = GlobalKey<FormState>();
  final myController = TextEditingController();

  Future<void> postTrackingNum(Tracking tracking) async {
    try {
      // ignore: unused_local_variable
      final response = await Caller.dio
          .post('/campaign/postTracking', data: tracking.toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('error ja post tracking');
      }
    }
  }

  void addTamboon() async {
    try {
      // ignore: unused_local_variable
      final response =
          await Caller.dio.put('/campaign/putTamboon?userId=${widget.userId}');
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('error ja add tamboon');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // myController.addListener(_printLatestValue);
    setState(() {
      tracking = Tracking(
        campaignId: widget.campaignId,
        userId: widget.userId,
        trackingNumber: "",
      );
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Form(
          key: _formkey,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 45,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.red[700]),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Add tracking number...',
                      hintStyle: const TextStyle(
                          color: Color(0xff858585), fontSize: 14),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter tracking number';
                      }
                      if (value.length < 13 || value.length > 14) {
                        return 'Please a a correct tracking number';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                CustomButton(
                  color: "primary",
                  text: "Add",
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      //post
                      tracking.trackingNumber = myController.text;
                      await postTrackingNum(tracking);
                      addTamboon();
                      notifyUser(widget.campaignId);

                      //modal
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            insetPadding: const EdgeInsets.symmetric(
                                vertical: 215, horizontal: 40),
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: const Column(
                              children: [
                                Image(
                                  image: AssetImage("assets/images/thank.png"),
                                  width: 90,
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Thank You ",
                                      // textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: Color.fromARGB(255, 244, 54, 105),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            content: const Column(
                              children: [
                                Text(
                                  "Thank you for your donation! ",
                                  //We appreciate every items and it will really help to make impact for those in need
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Text(
                                  "We appreciate every items and it will really help to make impact for those in need",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ],
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                    child: CustomButton(
                                      color: "primary",
                                      text: "   Back to home page   ",
                                      onTap: () {
                                        Navigator.pushNamed(context, '/home');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  paddingHorizontal: const EdgeInsets.symmetric(horizontal: 60),
                ),
              ]),
            ],
          ))
    ]);
  }
}
