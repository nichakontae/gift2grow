import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/tracking.dart';
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

  void postTrackingNum(Tracking tracking) async {
    try {
      // ignore: unused_local_variable
      final response = await Caller.dio
          .post('/campaign/postTracking', data: tracking.toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('error ja');
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

  // void _printLatestValue() {
  //   print('Tracking number: ${myController.text}');
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                        // labelText: 'Tracking number',
                        // labelStyle:
                        //     TextStyle(color: Color.fromARGB(128, 38, 38, 38)),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide:
                        //       BorderSide(color: DefaultSelectionStyle.defaultColor),
                        // ),
                        errorStyle: TextStyle(color: Colors.red[700]),
                        border: InputBorder.none,
                        hintText: 'Add tracking number...',
                        hintStyle: const TextStyle(
                            color: Color(0xff858585), fontSize: 14),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      // autofocus: true,
                      // maxLines: 1,
                      // onChanged: (value) {
                      //   setState(() {
                      //     trackingNumber = value;
                      //   });
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter tracking number';
                        }
                        if (value.length < 13 || value.length > 14) {
                          return 'Please add a correct tracking number';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      color: "primary",
                      text: "Add",
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          //post
                          tracking.trackingNumber = myController.text;
                          postTrackingNum(tracking);

                          //modal
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
                                      image:
                                          AssetImage("assets/images/thank.png"),
                                      width: 90,
                                      height: 90,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Thank You ",
                                          // textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          size: 20,
                                          color:
                                              Color.fromARGB(255, 244, 54, 105),
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
                                        padding: const EdgeInsets.fromLTRB(0,0,0,10),
                                        
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
                      paddingHorizontal:
                          const EdgeInsets.symmetric(horizontal: 60),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
