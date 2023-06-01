import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gift2grow/widgets/profile_widgets/history_section.dart';
import 'package:gift2grow/widgets/profile_widgets/user_info_section.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userlogin = 'userlogin';
    return userlogin == null
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Gift2Grow'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xFF9468AC),
                  Color.fromARGB(255, 255, 255, 255)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: const Center(child: Text('please login'))),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Gift2Grow'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF9468AC),
                Color.fromARGB(255, 255, 255, 255)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: ListView(
                children: [
                  const UserInfo(),
                ],
              ),
            ),
          );
  }
}
