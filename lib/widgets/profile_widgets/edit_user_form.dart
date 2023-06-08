import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/user_info.dart';
import 'package:gift2grow/screen/bottom_navbar.dart';
import 'package:gift2grow/utilities/upload.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utilities/caller.dart';
import '../theme_button.dart';

class EditProfileform extends StatefulWidget {
  const EditProfileform({super.key, required this.userInfo});
  final MyUserInfo? userInfo;

  @override
  State<EditProfileform> createState() => _EditProfileformState();
}

class _EditProfileformState extends State<EditProfileform> {
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isOk = false;

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.userInfo!.userName;
    _firstNameController.text = widget.userInfo!.firstName;
    _lastNameController.text = widget.userInfo!.lastName;
    _emailController.text = widget.userInfo!.email;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      Navigator.of(context).pop();
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        widget.userInfo!.profileImageFile = file;
      });
    }

    Future<void> updateEmail() async {
      final currentUser = FirebaseAuth.instance.currentUser;
      final currentEmail = currentUser!.email;

      final newEmail = _emailController.text;

      try {
        final credential =
            EmailAuthProvider.credential(email: currentEmail as String, password: '123456789');
        await currentUser.reauthenticateWithCredential(credential);
        await currentUser.updateEmail(newEmail);
        if (kDebugMode) {
          print("Email updated successfully.");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-mismatch') {
          if (kDebugMode) {
            print("The credential used to re-authenticate does not match the current user.");
          }
        } else if (e.code == 'wrong-password') {
          if (kDebugMode) {
            print("The current password provided is incorrect.");
          }
        } else {
          if (kDebugMode) {
            print("An error occurred during re-authentication: $e");
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print("An error occurred while updating email: $e");
        }
      }
    }

    Future<void> updateProfile() async {
      try {
        await Caller.dio.put(
          '/profile/updateProfile?userId=${widget.userInfo!.userId}',
          data: {
            "username": _usernameController.text,
            "first_name": _firstNameController.text,
            "last_name": _lastNameController.text,
            "email": _emailController.text,
          },
        );
        updateEmail();
        if (widget.userInfo!.profileImageFile != null) {
          try {
            XFile file = widget.userInfo!.profileImageFile!;
            String fileName = file.path.split('/').last;
            FormData formData = FormData.fromMap({
              "image": await MultipartFile.fromFile(file.path, filename: fileName),
              "userId": widget.userInfo!.userId,
            });
            final upload = await UploadCaller.dio.post('/profileImg', data: formData);
            if (kDebugMode) {
              print(upload.data);
            }
            setState(() {
              _isOk = true;
            });
          } on DioError catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
        setState(() {
          _isloading = false;
        });
        // ignore: use_build_context_synchronously
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.response);
        }
      }
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      if (_isOk || widget.userInfo!.profileImageFile == null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MyBottomNavbar(
                      screen: 3,
                    )));
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              title: const Text("Fail to uplaod image"),
              content: const Text(
                  "Plase make sure that your Image does not exceed 4MB and the file type is either JPEG, JPG or PNG"),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    void showPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            title: const Text("Upload Image"),
            content: const Text(
                "Plase make sure that your Image does not exceed 4MB and the file type is either JPEG, JPG or PNG"),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: const Text("Cancle", style: TextStyle(fontSize: 18)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 25,
                    child: VerticalDivider(
                      color: Colors.black.withAlpha(100),
                      thickness: 2,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  TextButton(
                    child: const Text("OK", style: TextStyle(fontSize: 18)),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
              child: Stack(
                children: [
                  widget.userInfo!.profileImageFile != null
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: FileImage(File(widget.userInfo!.profileImageFile!.path)),
                          radius: 90.0,
                        )
                      : widget.userInfo!.profileImage != null
                          ? CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  'http://server1.ivelse.com:8080${widget.userInfo!.profileImage}'),
                              radius: 90.0,
                            )
                          : const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage('assets/images/profileNull.png'),
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
                        showPopup();
                      },
                    ),
                  )
                ],
              ),
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
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[A-Za-z][A-Za-z\d]{5,29}$').hasMatch(value)) {
                              return "username must be at least 6 characters";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Color.fromARGB(128, 38, 38, 38)),
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
                        child: TextFormField(
                          controller: _firstNameController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^\w+$').hasMatch(value)) {
                              return "Please enter text";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(color: Color.fromARGB(128, 38, 38, 38)),
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
                        child: TextFormField(
                          controller: _lastNameController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^\w+$').hasMatch(value)) {
                              return "Please enter text";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(color: Color.fromARGB(128, 38, 38, 38)),
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
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Color.fromARGB(128, 38, 38, 38)),
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
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                setState(() {
                                  _isloading = true;
                                  if (_isloading) {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30.0)),
                                              content: SizedBox(
                                                height: 120,
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          children: [
                                                            CircularProgressIndicator(
                                                              color: Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            const Text("Loading...")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ));
                                  }
                                  updateProfile();
                                });
                              } catch (e) {
                                if (kDebugMode) {
                                  print(e);
                                }
                              }
                            }
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
