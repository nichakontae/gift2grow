import 'package:flutter/material.dart';
import 'package:gift2grow/widgets/profile_frame1st.dart';
import 'package:gift2grow/widgets/profile_frame2nd.dart';
import 'package:gift2grow/widgets/profile_frame3rd.dart';
import 'package:gift2grow/widgets/rank_card_profile.dart';

class RankPage extends StatelessWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              children: [
                //Padding(padding: EdgeInsets.fromLTRB(0, 65, 0, 5)),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 65, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ranking",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
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
                      Center(
                        child: Profile1st(),
                        heightFactor: 1.3,
                      ),
                      Positioned(
                          top: 63,
                          left: 32,
                          child: Transform.scale(
                            child: Profile2nd(),
                            scale: 0.8,
                          )),
                      Positioned(
                          top: 63,
                          left: 245,
                          child: Transform.scale(
                            child: Profile3rd(),
                            scale: 0.8,
                          )),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(76.5, 60, 0, 0),
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
                            padding: const EdgeInsets.fromLTRB(0, 60, 76.5, 0),
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
                        padding: const EdgeInsets.fromLTRB(53.5, 180, 52, 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("username",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                Text("8888 TAMBOON",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Text("username",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                Text("8888 TAMBOON",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Text("username",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                Text("8888 TAMBOON",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.fromLTRB(27, 17, 27, 15),
                //       child: Card(
                //           elevation: 4,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(
                //                 20.0), // Adjust the radius as per your preference
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(13.5),
                //             child: Column(
                //               children: List.generate(
                //                 4, // Replace with the actual number of items
                //                 (index) => RankCardProfile(index + 4),
                //               ),
                //             ),
                //           )),
                //     )
                //   ],
                // ),
                Column(
                  children: List.generate(
                    4, // Replace with the actual number of items
                    (index) => Padding(
                      padding: const EdgeInsets.fromLTRB(27, 2, 27, 0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.5),
                          child: Column(
                            children: [RankCardProfile(index + 4)],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
