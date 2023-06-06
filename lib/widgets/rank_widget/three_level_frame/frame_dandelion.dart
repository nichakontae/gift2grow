import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/user_profile_for_share.dart';

class FrameDandelion extends StatelessWidget {
  const FrameDandelion({Key? key, required this.profile}) : super(key: key);
  final UserProfileForShare profile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 73,
      child: Stack(
        children: [
          Positioned(
            left: 15,
            child: CircleAvatar(
              backgroundImage: profile.profileImage == null
                  ? const AssetImage("assets/images/profileNull.png")
                  : NetworkImage(
                          "http://server1.ivelse.com:8080${profile.profileImage}")
                      as ImageProvider,
              radius: 35,
            ),
          ),
          Positioned(
            top: 48,
            left: 58,
            child: Image.asset(
              'assets/images/Dandelion.png',
              scale: 2.7,
            ),
          ),
        ],
      ),
    );
  }
}
