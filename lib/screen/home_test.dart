import 'package:flutter/material.dart';
import 'package:gift2grow/screen/profile_page.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: CustomButton(
          text: "GO!",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
          color: 'primary',
        ));
  }
}
