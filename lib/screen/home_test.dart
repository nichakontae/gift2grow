import 'package:flutter/material.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 50,
              child: CustomButton(
                text: "GOhistory!",
                onTap: () {
                  Navigator.pushNamed(context, '/donatehistory');
                },
                color: 'primary',
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: CustomButton(
                text: "GOprofile",
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                color: 'primary',
              ),
            ),
          ],
        ));
  }
}
