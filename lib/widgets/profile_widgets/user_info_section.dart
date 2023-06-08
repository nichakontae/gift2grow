import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/user_info.dart';
import 'package:gift2grow/screen/edit_profile_page.dart';
import 'package:gift2grow/widgets/profile_widgets/history_section.dart';
import 'package:gift2grow/widgets/theme_button.dart';
import '../../models/donate_history.dart';
import '../../utilities/caller.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key, required this.userInfo});
  final MyUserInfo? userInfo;

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  void initState() {
    super.initState();
    getDonateHistory();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DonateHistoryDetail>? donateHistory;

  Future<void> getDonateHistory() async {
    try {
      final response = await Caller.dio.get(
        '/profile/getDonateHistory?userId=${widget.userInfo!.userId}',
      );
      setState(() {
        donateHistory = List.generate(
            response.data.length,
            (index) => DonateHistoryDetail(
                  campaignId: response.data[index]['campaign']['id'],
                  trackingNumber: response.data[index]['tracking_number'],
                  donatedAt: response.data[index]['donation_date'],
                  schoolName: response.data[index]['campaign']['school_name'],
                  isCompleted: response.data[index]['campaign']['is_completed'],
                ));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (donateHistory == null) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      );
    }
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
              child: widget.userInfo!.profileImage != null
                  ? CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'http://server1.ivelse.com:8080${widget.userInfo!.profileImage}'),
                      radius: 90.0,
                    )
                  : const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profileNull.png'),
                      radius: 90.0,
                    ),
            ),
            Text(
              widget.userInfo!.userName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Profile",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        'assets/images/edit_black.png',
                        width: 19,
                        height: 19,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditProfilePage(
                          userInfo: widget.userInfo,
                        );
                      }));
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text(
                        "Name : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff9468AC)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.userInfo!.firstName} ${widget.userInfo!.lastName}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text(
                        "Email  : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff9468AC)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.userInfo!.email,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
              donateHistory!.isEmpty || donateHistory == null
                  ? Column(children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("History",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '0 succesful donations',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff9468AC)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/home'),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.5), //Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                                  offset: const Offset(0.0, 3.0), //(x,y)
                                  blurRadius: 7.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                    child: Text('You have 0 donation history',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff9468AC))),
                                  ),
                                ),
                                Image(
                                  image: const AssetImage('assets/images/nong_unicorn.png'),
                                  width: MediaQuery.of(context).size.width * 0.3,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                  child: Text(
                                    "Let's go donated!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9468AC)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ])
                  : Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("History",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${donateHistory!.length} succesful donations',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff9468AC)),
                            ),
                          ],
                        ),
                        if (donateHistory!.length == 1)
                          DonateHistory(
                            donateHistory: donateHistory![0],
                          ),
                        if (donateHistory!.length > 1)
                          for (var i = 0; i < 2; i++)
                            DonateHistory(
                              donateHistory: donateHistory![i],
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/donatehistory');
                                },
                                child: const Text(
                                  'show more...',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff9468AC)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                child: CustomButton(
                    color: 'primary',
                    text: 'LogOut',
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Colors.white,
                          title: const Image(
                            image: AssetImage(
                              'assets/images/exclamation-mark.png',
                            ),
                            height: 125,
                          ),
                          content: const Text(
                            'Are you sure you want to log out?',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    height: MediaQuery.of(context).size.height * 0.045,
                                    child: CustomButton(
                                      color: 'tertiary',
                                      text: 'Cancel',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    height: MediaQuery.of(context).size.height * 0.045,
                                    child: CustomButton(
                                      color: 'primary',
                                      text: 'Confirm',
                                      onTap: () async {
                                        await FirebaseAuth.instance.signOut().then(
                                              (_) => Navigator.pushNamed(context, '/login'),
                                            );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
