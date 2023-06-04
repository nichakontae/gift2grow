import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/user_info.dart';
import 'package:gift2grow/widgets/profile_widgets/user_info_section.dart';
import 'package:gift2grow/widgets/topleft.dart';

import '../utilities/caller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final User? user = auth.currentUser;
    final uid = user!.uid;
    setState(() {
      getUserInfo(uid);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  MyUserInfo? userInfo;

  Future<void> getUserInfo(uid) async {
    try {
      final response = await Caller.dio.get(
        '/profile/getProfile?userId=$uid',
      );
      setState(() {
        userInfo = MyUserInfo(
          userId: response.data["id"],
          userName: response.data["username"],
          profileImage: response.data["profile_image"],
          firstName: response.data["first_name"],
          lastName: response.data['last_name'],
          email: response.data['email'],
        );
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userInfo == null) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator()],
      );
    }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.primary, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ListView(
          children: [
            const MyTopLeft(),
            UserInformation(
              userInfo: userInfo,
            ),
          ],
        ),
      ),
    );
  }
}
