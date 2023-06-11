import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/ranking_users.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Profile1st extends StatelessWidget {
  const Profile1st({Key? key, required this.users}) : super(key: key);
  final RankingUsers users;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleShadow(
          opacity: 0.3,
          offset: const Offset(0, 1.4),
          sigma: 1,
          child: Image.asset(
            'assets/images/Firework.png',
            scale: 3,
          ),
        ),
        Positioned(
          top: 54,
          left: 46,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 1,
                  spreadRadius: -1.4,
                  offset: const Offset(-0.2, 0),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/FirstCircle.png',
              scale: 3,
            ),
          ),
        ),
        Positioned(
            top: 57,
            left: 50,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: users.profileImage == null || users.profileImage == ""
                  ? const AssetImage("assets/images/profileNull.png")
                  : NetworkImage("http://server1.ivelse.com:8080${users.profileImage}")
                      as ImageProvider,
              radius: 35,
            )),
        Positioned(
          top: 89,
          left: 44,
          child: SimpleShadow(
            opacity: 0.35,
            offset: const Offset(0, 1),
            sigma: 1.25,
            child: Image.asset(
              'assets/images/Angel_wing.png',
              scale: 2.9,
            ),
          ),
        ),
        Positioned(
          top: 116,
          left: 68,
          child: SimpleShadow(
            sigma: 1,
            offset: const Offset(0, 1),
            opacity: 0.35,
            child: Image.asset(
              'assets/images/BigStar.png',
              scale: 2.9,
            ),
          ),
        ),
        Positioned(
          top: 131,
          left: 55,
          child: SimpleShadow(
            sigma: 0.75,
            offset: const Offset(0, 1),
            opacity: 0.3,
            child: Image.asset(
              'assets/images/SmallStar.png',
              scale: 2.6,
            ),
          ),
        ),
        Positioned(
          top: 131,
          left: 98,
          child: SimpleShadow(
            sigma: 0.75,
            offset: const Offset(0, 1),
            opacity: 0.3,
            child: Image.asset(
              'assets/images/SmallStar.png',
              scale: 2.6,
            ),
          ),
        ),
      ],
    );
  }
}
