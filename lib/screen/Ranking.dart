// ignore_for_file: file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/ranking_users.dart';
import 'package:gift2grow/models/rank/ranking_users_list.dart';
import 'package:gift2grow/models/rank/response_user_profile_for_share.dart';
import 'package:gift2grow/models/rank/user_profile_for_share.dart';
import 'package:gift2grow/utilities/caller.dart';
import 'package:gift2grow/widgets/rank_widget/profile_for_top_three/profile_frame1st.dart';
import 'package:gift2grow/widgets/rank_widget/rank_card_profile.dart';
import 'package:gift2grow/widgets/rank_widget/preview_share.dart';
import '../widgets/rank_widget/profile_for_top_three/profile_frame2nd.dart';
import '../widgets/rank_widget/profile_for_top_three/profile_frame3rd.dart';

class RankPage extends StatefulWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  List<RankingUsers>? _rankingUsers = [];
  UserProfileForShare profile = UserProfileForShare(
    userId: FirebaseAuth.instance.currentUser!.uid,
    username: "",
    profileImage: null,
    tamboonPoint: 0,
  );

  Future getUserProfileForShare() async {
    try {
      final response = await Caller.dio.get(
          "/rank/getProfileForShare?userId=${FirebaseAuth.instance.currentUser?.uid}");
      ResponseUserProfileForShare d =
          ResponseUserProfileForShare.fromJson(response.data);
      setState(() {
        profile = d.data;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void fetchUsers() async {
    try {
      final response = await Caller.dio.get("/rank/getAllUsers");
      //print("700");

      RankingUsersList data1 = RankingUsersList.fromJson(response.data);
      //print("600");
      setState(() {
        _rankingUsers = data1.data;
        //print("500");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
    getUserProfileForShare();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    int ranking = 0;
    if (_rankingUsers!.isEmpty) {
      return MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF9468AC),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 74, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not have user",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Add your content here
              ],
            ),
          ),
        ),
      );
    }
    if (_rankingUsers!.length >= 20) {
      count = 17;
    } else {
      count = _rankingUsers!.length - 3;
    }

    while (_rankingUsers![ranking].userId != profile.userId) {
      ranking++;
    }
    ranking++;
    //print(userList);
    //print(_rankingUsers);
    return MediaQuery(
      data: const MediaQueryData(),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF9468AC),
                      Colors.white,
                    ],
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Padding(padding: EdgeInsets.fromLTRB(0, 65, 0, 5)),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 74, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ranking",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text(
                                  "1st",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          //Padding(padding: EdgeInsets.only(bottom: 20)),
                          //ต้องเปลี่ยนprofileให้เป็ยของuserแต่ละอันดับ
                          Center(
                            heightFactor: 1.3,
                            child: Profile1st(
                              //profile: profile,
                              users: _rankingUsers![0],
                            ),
                          ),
                          Positioned(
                              top: 63,
                              left: 32,
                              child: Transform.scale(
                                scale: 0.8,
                                child: Profile2nd(
                                  users: _rankingUsers![1],
                                ),
                              )),
                          Positioned(
                              top: 63,
                              left: 245,
                              child: Transform.scale(
                                scale: 0.8,
                                child: Profile3rd(
                                  users: _rankingUsers![2],
                                ),
                              )),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(76.5, 60, 0, 0),
                                child: Text(
                                  "2nd",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 60, 76.5, 0),
                                child: Text(
                                  "3rd",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(58, 180, 57, 17),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        _rankingUsers![1].username,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "${_rankingUsers![1].tamboonPoint} TAMBOON",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(20)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        _rankingUsers![0].username,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "${_rankingUsers![0].tamboonPoint} TAMBOON",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(20)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        _rankingUsers![2].username,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "${_rankingUsers![2].tamboonPoint} TAMBOON",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      Column(
                        children: List.generate(
                          count, // Replace with the actual number of items
                          (index) => Padding(
                            padding: const EdgeInsets.fromLTRB(27, 2, 27, 0),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.5),
                                child: Column(
                                  children: [
                                    RankCardProfile(
                                      user: _rankingUsers![index + 3],
                                      index: index + 4,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(38))
                    ],
                  )),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 715,
              child: Card(
                color: const Color(0xFFFECE6B),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("  Your Rank  ",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Text("#$ranking",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF9468AC))),
                          const Spacer(),
                          Text("${profile.tamboonPoint} TAMBOON",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF9468AC))),
                          // ตอนดึงข้อมูลuserมาแล้วเช็คif(1/2/3)else(เช็คlevel)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PreviewShare(
                                    profile: profile,
                                    ranking: ranking,
                                    users: _rankingUsers![ranking - 1],
                                  ),
                                ), //widget for test sharing
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(9, 0, 9, 2),
                              child: Image.asset('assets/icon/share.png',
                                  scale: 28),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
