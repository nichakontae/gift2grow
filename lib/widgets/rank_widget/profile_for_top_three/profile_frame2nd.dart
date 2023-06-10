import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/ranking_users.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Profile2nd extends StatelessWidget {
  const Profile2nd({Key? key, required this.users}) : super(key: key);
  final RankingUsers users;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 127,
      child: Stack(
        children: [
          SimpleShadow(
            opacity: 0.3,
            offset: const Offset(0, 1.2),
            sigma: 0.9,
            child: Image.asset(
              'assets/images/Firework.png',
              scale: 4.3,
            ),
          ),
          Positioned(
            top: 28,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 1,
                    spreadRadius: -1.45,
                    offset: const Offset(-0.2, 0.3),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/SecondCircle.png',
                scale: 3,
              ),
            ),
          ),
          Positioned(
              top: 31,
              left: 24,
              child: CircleAvatar(
                backgroundImage: users.profileImage == null ||
                        users.profileImage == ""
                    ? const AssetImage("assets/images/profileNull.png")
                    : NetworkImage(
                            "http://server1.ivelse.com:8080${users.profileImage}")
                        as ImageProvider,
                radius: 35,
              )),
          Positioned(
            top: 63,
            left: 18,
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
            top: 88,
            left: 42,
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
            top: 106,
            left: 29,
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
            top: 106,
            left: 72,
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
      ),
    );
  }
}
