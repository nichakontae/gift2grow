import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/user_profile_for_share.dart';

class Profile1st extends StatelessWidget {
  const Profile1st({Key? key, required this.profile}) : super(key: key);
  final UserProfileForShare profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/Firework.png',
          scale: 3,
        ),
        Positioned(
          top: 54,
          left: 46,
          child: Image.asset(
            'assets/images/FirstCircle.png',
            scale: 3,
          ),
        ),
        Positioned(
          top: 57,
          left: 50,
          child:CircleAvatar(
            backgroundImage: profile.profileImage == null? const AssetImage("assets/images/profileNull.png"): NetworkImage("http://server1.ivelse.com:8080${profile.profileImage}") as ImageProvider,
            radius: 35,
          )
        ),
        Positioned(
          top: 81,
          left: 44,
          child: Image.asset(
            'assets/images/Angel_wing.png',
            scale: 2.9,
          ),
        ),
        Positioned(
          top: 113,
          left: 68,
          child: Image.asset(
            'assets/images/BigStar.png',
            scale: 2.9,
          ),
        ),
        Positioned(
          top: 131,
          left: 55,
          child: Image.asset(
            'assets/images/SmallStar.png',
            scale: 2.6,
          ),
        ),
        Positioned(
          top: 131,
          left: 98,
          child: Image.asset(
            'assets/images/SmallStar.png',
            scale: 2.6,
          ),
        ),
      ],
    );
  }
}
