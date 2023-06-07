import 'package:flutter/material.dart';
import 'package:gift2grow/widgets/rank_widget/show_level_quote.dart';
import 'package:gift2grow/widgets/rank_widget/three_level_frame/frame_born_angel.dart';
import 'package:gift2grow/widgets/rank_widget/three_level_frame/frame_dandelion.dart';
import 'package:gift2grow/widgets/rank_widget/three_level_frame/frame_trainee_angel.dart';

import '../../../../../models/rank/user_profile_for_share.dart';

class ShareRankLevel extends StatelessWidget {
  const ShareRankLevel(
      {Key? key,
      required this.profile,
      required this.ranking,
      required this.donations})
      : super(key: key);
  final UserProfileForShare profile;
  final int ranking;
  final int donations;

  @override
  Widget build(BuildContext context) {
    final tamboonPoint = profile.tamboonPoint;
    String rank;
    StatelessWidget frame;
    if (tamboonPoint >= 0 && tamboonPoint <= 100) {
      rank = 'Little Dandelion';
      frame = FrameDandelion(profile: profile);
    } else if (tamboonPoint > 100 && tamboonPoint <= 250) {
      rank = 'Trainee Angel';
      frame = FrameTraineeAngel(profile: profile);
    } else {
      rank = 'Born to be Angel';
      frame = FrameBornAngel(profile: profile);
    }

    return MediaQuery(
      data: const MediaQueryData(),
      child: Container(
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
                Text(
                  "You are in #$ranking",
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  '"$rank"',
                  style: const TextStyle(
                      fontSize: 32,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 100, 98, 98),
                          offset: Offset(0, 2),
                          blurRadius: 9,
                        ),
                      ],
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(43, 118, 8, 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 2.5, // Adjust the scale factor as needed
                        child: frame,
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
                        SizedBox(
                          child: Text(
                            profile.username,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9468AC),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text('${profile.tamboonPoint} TAMBOON',
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
                        ShowLevelQuote(tamboonPoint: tamboonPoint)
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
