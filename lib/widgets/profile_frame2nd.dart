import 'package:flutter/material.dart';

class Profile2nd extends StatelessWidget {
  const Profile2nd({Key? key}) : super(key: key);

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
            'assets/images/SecondCircle.png',
            scale: 3,
          ),
        ),
        Positioned(
          top: 32,
          left: 24,
          child: Image.asset(
            'assets/images/GrayCircle.png',
            scale: 3.03,
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
