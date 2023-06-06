import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/user_profile_for_share.dart';

class Profile3rd extends StatelessWidget {
  const Profile3rd({Key? key, required this.profile}) : super(key: key);
  final UserProfileForShare profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/Firework.png',
          scale: 4.3,
        ),
        Positioned(
          top: 28,
          left: 20,
          child: Image.asset(
            'assets/images/ThirdCircle.png',
            scale: 3,
          ),
        ),
        Positioned(
          top: 31,
          left: 24,
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
          top: 53,
          left: 18,
          child: Image.asset(
            'assets/images/Angel_wing.png',
            scale: 2.9,
          ),
        ),
        Positioned(
          top: 85,
          left: 42,
          child: Image.asset(
            'assets/images/BigStar.png',
            scale: 2.9,
          ),
        ),
        Positioned(
          top: 103,
          left: 29,
          child: Image.asset(
            'assets/images/SmallStar.png',
            scale: 2.6,
          ),
        ),
        Positioned(
          top: 103,
          left: 72,
          child: Image.asset(
            'assets/images/SmallStar.png',
            scale: 2.6,
          ),
        ),
      ],
    );
  }
}