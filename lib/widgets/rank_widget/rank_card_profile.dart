import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/ranking_users.dart';

class RankCardProfile extends StatelessWidget {
  final int index;
  final RankingUsers user;
  const RankCardProfile({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "#${index.toString()}",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
          child: CircleAvatar(
            backgroundImage: user.profileImage == null ||
                    user.profileImage == ""
                ? const AssetImage("assets/images/profileNull.png")
                : NetworkImage(
                        "http://server1.ivelse.com:8080${user.profileImage}")
                    as ImageProvider,
            radius: 35,
          ),
        ),
        Text(
          user.username,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Text(
          user.tamboonPoint.toString(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 5),
          child: Image.asset(
            'assets/images/PointBox.png',
            scale: 6.3,
          ),
        ),
      ],
    );
  }
}
