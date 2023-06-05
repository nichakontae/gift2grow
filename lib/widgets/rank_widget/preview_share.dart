// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/user_profile_for_share.dart';
import 'package:gift2grow/widgets/rank_widget/preview_share_icon.dart';
import 'package:gift2grow/widgets/rank_widget/profile_for_top_three/profile_frame1st.dart';
import 'package:gift2grow/widgets/rank_widget/share_template/first_rank.dart';
import 'package:screenshot/screenshot.dart';

class PreviewShare extends StatefulWidget {
  const PreviewShare({Key? key, required this.profile}) : super(key: key);
  final UserProfileForShare profile;

  @override
  State<PreviewShare> createState() => _PreviewShareState();
}

class _PreviewShareState extends State<PreviewShare> {
  final controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FirstRank(profile: widget.profile),
        Positioned(
          top: 70,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 103, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Perform the back navigation
              },
              child: Image.asset(
                'assets/icon/cancel.png',
                scale: 14,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  //color: Colors.black,
                  color: Colors.black.withOpacity(0.25), // Shadow color
                  blurRadius: 1, // Spread radius
                  offset: const Offset(1, 2), // Offset in x and y directions
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () async {
                final image = await controller
                    .captureFromWidget(FirstRank(profile: widget.profile));
              },
              child: Image.asset(
                'assets/icon/download.png',
                scale: 12,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 20,
          child: Image.asset(
            'assets/icon/facebook.png',
            scale: 12,
          ),
        ),
        Positioned(
          bottom: 14,
          left: 75,
          child: Image.asset(
            'assets/icon/twitter.png',
            scale: 11.9,
          ),
        ),
        Positioned(
          bottom: 13.5,
          left: 130,
          child: Image.asset(
            'assets/icon/instagram.png',
            scale: 11.5,
          ),
        ),
      ],
    );
  }
}
