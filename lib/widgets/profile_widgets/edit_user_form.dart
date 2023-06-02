import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/user_info.dart';
import 'package:gift2grow/screen/profile_page.dart';
import 'package:image_picker/image_picker.dart';

import '../theme_button.dart';

class EditProfileform extends StatefulWidget {
  const EditProfileform({super.key, required this.userInfo});
  final UserInfo userInfo;

  @override
  State<EditProfileform> createState() => _EditProfileformState();
}

class _EditProfileformState extends State<EditProfileform> {
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'Username';
    _firstNameController.text = 'First Name';
    _lastNameController.text = 'Last Name';
    _emailController.text = 'Email';
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        widget.userInfo.profileImageFile = file;
      });
    }

    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
              child: Stack(
                children: [
                  widget.userInfo.profileImageFile != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(
                              File(widget.userInfo.profileImageFile!.path)),
                          radius: 90.0,
                        )
                      :
                      // CircleAvatar(
                      //   backgroundImage: NetworkImage(
                      //       'https://happeningandfriends.com/uploads/happening/products/46/004554/mock_ST_newSadCat.jpg'),
                      //   radius: 90.0,
                      // ),
                      const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profileNull.png'),
                          radius: 90.0,
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 5, 5, 5),
                            child: Image.asset(
                              'assets/images/edit.png',
                              scale: 25,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        getImage();
                      },
                    ),
                  )
                ],
              ),
            ),
            const Text(
              "User Name",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(128, 38, 38, 38)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9468AC)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          controller: _firstNameController,
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(128, 38, 38, 38)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9468AC)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(128, 38, 38, 38)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9468AC)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(128, 38, 38, 38)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9468AC)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: CustomButton(
                          color: 'tertiary',
                          text: 'Cancel',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: CustomButton(
                          color: 'primary',
                          text: 'Confirm',
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const ProfilePage(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
