import 'package:flutter/material.dart';

import '../../../models/rank/user_profile_for_share.dart';
import '../profile_for_top_three/profile_frame1st.dart';

class FirstRank extends StatelessWidget {
  const FirstRank({Key? key, required this.profile}) : super(key: key);
  final UserProfileForShare profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF9569AC),
                Color(0xFFFFFAEF),
              ],
              stops: [0, 0.74],
            )),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(0, 74, 0, 0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Ranking",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const Padding(padding: EdgeInsets.all(2)),
                const Text(
                  "You are in #1st",
                  style: TextStyle(
                      fontSize: 29,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 100, 98, 98),
                          offset: Offset(0, 2),
                          blurRadius: 9,
                        ),
                      ],
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 80, 8, 85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 2.2, // Adjust the scale factor as needed
                        child: Profile1st(profile: profile,),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                    child: Column(
                      children: [
                        Text(profile.username,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9468AC))),
                        Text('${profile.tamboonPoint} TAMBOON',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9468AC))),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              '"You have made a total of 120 donations"',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFC107))),
                        ),
                        //ทำเช็คว่าอยู่levelไหน
                        const Text(
                          'For truly we are all angels',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9468AC),
                          ),
                        ),
                        const Text(
                          'temporarily hiding as humans.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9468AC),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.181,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/Cloud_right.png',
                      scale: 1,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/images/Cloud_left.png',
                      scale: 1,
                    ),
                  ),
                  // const PreviewShareIcon()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
