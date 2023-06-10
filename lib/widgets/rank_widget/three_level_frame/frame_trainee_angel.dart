import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/user_profile_for_share.dart';
import 'package:simple_shadow/simple_shadow.dart';

class FrameTraineeAngel extends StatelessWidget {
  const FrameTraineeAngel({Key? key, required this.profile}) : super(key: key);
  final UserProfileForShare profile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 98,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 1,
                    spreadRadius: -1.75,
                    offset: const Offset(-0.2, -0.3),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/GrayCircle.png',
                scale: 2.68,
              ),
            ),
          ),
          Positioned(
            top: 5.5,
            left: 15,
            child: CircleAvatar(
              backgroundImage: profile.profileImage == null ||
                      profile.profileImage == ""
                  ? const AssetImage("assets/images/profileNull.png")
                  : NetworkImage(
                          "http://server1.ivelse.com:8080${profile.profileImage}")
                      as ImageProvider,
              radius: 35,
            ),
          ),
          Positioned(
            top: 53.5,
            left: 54,
            child: SimpleShadow(
              opacity: 0.35,
              offset: const Offset(0, 1),
              sigma: 0.9,
              child: Image.asset(
                'assets/images/Butterfly.png',
                scale: 2.7,
              ),
            ),
          ),
          Positioned(
            top: 40.5,
            left: 79,
            child: SimpleShadow(
              opacity: 0.3,
              offset: const Offset(0, 1.3),
              sigma: 0.8,
              child: Image.asset(
                'assets/images/Lambent.png',
                scale: 2.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
