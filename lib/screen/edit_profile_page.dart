import 'package:flutter/material.dart';
import 'package:gift2grow/screen/profile_page.dart';
import 'package:gift2grow/widgets/profile_widgets/edit_user_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift2Grow'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF9468AC), Color.fromARGB(255, 255, 255, 255)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ListView(
          children: const [
            EditProfileform(),
          ],
        ),
      ),
    );
  }
}
