import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/utilities/caller.dart';

class MyTopLeft extends StatefulWidget {
  const MyTopLeft({super.key});

  @override
  State<MyTopLeft> createState() => _MyTopLeftState();
}

class _MyTopLeftState extends State<MyTopLeft> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var tamboon = 0;

  @override
  void initState() {
    super.initState();
    final User? user = auth.currentUser;
    final uid = user!.uid;
    setState(() {
      getUserTamboon(uid);
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
          child: const Image(
            image: AssetImage("assets/images/bell.png"),
            width: 50,
            height: 50,
          ),
          onTap: () {},
        )
      ],
    );
  }
}
