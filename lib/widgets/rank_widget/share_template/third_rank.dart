import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/ranking_users.dart';
import 'package:gift2grow/widgets/rank_widget/show_level_quote.dart';
import '../profile_for_top_three/profile_frame3rd.dart';

class ThirdRank extends StatelessWidget {
  const ThirdRank({Key? key, required this.users, required this.donations})
      : super(key: key);
  final RankingUsers users;
  final int donations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
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
                  "You are in #3rd",
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
                  padding: const EdgeInsets.fromLTRB(8, 90, 8, 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 2.2, // Adjust the scale factor as needed
                        child: Profile3rd(users: users),
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
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 22),
                    child: Column(
                      children: [
                        Text(
                          users.username,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9468AC),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('${users.tamboonPoint} TAMBOON',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9468AC))),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 9, 4, 3),
                          child: Text(
                              '"You have made a total of $donations donations"',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFC107))),
                        ),
                        //ทำเช็คว่าอยู่levelไหน
                        ShowLevelQuote(tamboonPoint: users.tamboonPoint),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.181,
            //   child:
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Image.asset(
                        'assets/images/Cloud_right.png',
                        scale: 0.8,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Image.asset(
                        'assets/images/Cloud_left.png',
                        scale: 1,
                      ),
                    ),
                  ),
                  // const PreviewShareIcon()
                ],
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
