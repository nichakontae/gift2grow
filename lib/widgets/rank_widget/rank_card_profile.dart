import 'package:flutter/material.dart';

class RankCardProfile extends StatelessWidget {
  final int index;
  const RankCardProfile(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          Text(
            "#${index.toString()}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
            child: Image.asset(
              'assets/images/GrayCircle.png',
              scale: 4.7,
            ),
          ),
          const Text(
            "username",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Text(
            "999",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 5),
            child: Image.asset(
              'assets/images/PointBox.png',
              scale: 6.3,
            ),
          ),
        ],
      ),
    );
  }
}
