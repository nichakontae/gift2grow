import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/utilities/caller.dart';

import '../screen/notification.dart';

class MyTopLeft extends StatefulWidget {
  const MyTopLeft({super.key});

  @override
  State<MyTopLeft> createState() => _MyTopLeftState();
}

class _MyTopLeftState extends State<MyTopLeft> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var tamboon = 0;
  var unreadNoti = 0;
  @override
  void initState() {
    super.initState();
    final User? user = auth.currentUser;
    final uid = user!.uid;
    setState(() {
      getUserTamboon(uid);
      getUnreadNoti(uid);
    });
  }

  void getUserTamboon(String uid) async {
    try {
      final response = await Caller.dio.get(
        '/profile/getProfile?userId=$uid',
      );
      setState(() {
        tamboon = response.data['tamboon_point'];
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getUnreadNoti(String uid) async {
    try {
      final response = await Caller.dio.get(
        '/noti/getUnreadNoti?userId=$uid',
      );
      setState(() {
        unreadNoti = response.data;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        tamboon < 9999
            ? Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        tamboon.toString(),
                        style: const TextStyle(fontSize: 22),
                      ),
                      const Image(
                        image: AssetImage("assets/icon/tamboon.png"),
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        tamboon.toString(),
                        style: const TextStyle(fontSize: 22),
                      ),
                      const Image(
                        image: AssetImage("assets/icon/tamboon.png"),
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
        GestureDetector(
          child: Stack(children: [
            const Image(
              image: AssetImage("assets/images/bell.png"),
              width: 50,
              height: 50,
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  unreadNoti.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationPage()),
            );
          },
        )
      ],
    );
  }
}
