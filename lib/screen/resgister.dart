import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/register_controller.dart';
import 'package:gift2grow/screen/verify_email.dart';
import 'package:gift2grow/utilities/caller.dart';
import 'package:gift2grow/widgets/background_gradient.dart';
import 'package:gift2grow/widgets/confirm_password_text_form_field.dart';
import 'package:gift2grow/widgets/password_text_form_field.dart';
import 'package:gift2grow/widgets/register_text_form_field.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final RegisterTextEditController _registerController =
      RegisterTextEditController();
  List<bool> password = [true, true];
  FirebaseAuth auth = FirebaseAuth.instance;
  bool emailAlreadyUse = false;
  bool loading = false;
  String errorMessage = "";

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              VerifyEmailPage(email: _registerController.email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    children: [
                      const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RegisterTextFormField(
                          controller: _registerController.usernameController,
                          validate: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[A-Za-z]{5,29}$').hasMatch(value)) {
                              return "username must be at least 5 characters";
                              // อย่าลืมใส่คำที่ดีกว่านี้
                            }
                            return null;
                          },
                          hintText: "Username"),
                      const SizedBox(
                        height: 20,
                      ),
                      RegisterTextFormField(
                          controller: _registerController.firstnameController,
                          validate: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^\w+$').hasMatch(value)) {
                              return "Please enter only text";
                              // อย่าลืมใส่คำที่ดีกว่านี้
                            }
                            return null;
                          },
                          hintText: "First Name"),
                      const SizedBox(
                        height: 20,
                      ),
                      RegisterTextFormField(
                          controller: _registerController.lastnameController,
                          validate: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^\w+$').hasMatch(value)) {
                              return "Please enter only text";
                              // อย่าลืมใส่คำที่ดีกว่านี้
                            }
                            return null;
                          },
                          hintText: "Last Name"),
                      const SizedBox(
                        height: 20,
                      ),
                      RegisterTextFormField(
                          controller: _registerController.emailController,
                          validate: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                              return 'Please enter a valid email';
                            } else if (emailAlreadyUse) {
                              return "The account already exists for that email.";
                            }
                            return null;
                          },
                          hintText: "Email"),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextFormField(
                          passwordVisible: password,
                          controller: _registerController.passwordController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            return null;
                          },
                          hintText: "Password"),
                      const SizedBox(
                        height: 20,
                      ),
                      ConfirmPasswordFormField(
                          confirmPasswordController:
                              _registerController.confirmPasswordController,
                          passwordController:
                              _registerController.passwordController,
                          hintText: "Confirm password"),
                      errorMessage != ""
                          ? const SizedBox(
                        height: 20,
                      )
                          : const Text(""),
                      errorMessage != ""
                          ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFEFF2),
                                  border: Border.all(
                                      color: const Color(0xFFB7415E),
                                      width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Text(
                                errorMessage,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ),
                          ),
                        ],
                      )
                          : const Text(""),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            color: "secondary",
                            text: "Back to Login",
                            onTap: () {},
                            paddingHorizontal:
                                const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          CustomButton(
                            color: "primary",
                            text: "Confirm",
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  setState(() => loading = true);
                                  print(loading);
                                  print(errorMessage);
                                  if (loading && errorMessage == "") {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              content: SizedBox(
                                                height: 120,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CircularProgressIndicator(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            const Text(
                                                                "Loading...")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ));
                                  }
                                  UserCredential userCredential =
                                      await auth.createUserWithEmailAndPassword(
                                          email: _registerController.email,
                                          password:
                                              _registerController.password);
                                  await Caller.dio.post("/auth/register", data:{
                                    "user_id": userCredential.user?.uid,
                                    "username": _registerController.username,
                                    "firstname":_registerController.firstname,
                                    "lastname": _registerController.lastname,
                                    "email": _registerController.email
                                  } );
                                  debugPrint("register successful");
                                  setState(() {
                                    loading = false;
                                    errorMessage = "";
                                  });
                                  navigate();
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'email-already-in-use') {
                                    setState(() => emailAlreadyUse = true);
                                    errorMessage = "The account already exists for that email.";
                                    debugPrint(
                                        'The account already exists for that email.');
                                  }
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              }
                            },
                            paddingHorizontal:
                                const EdgeInsets.symmetric(horizontal: 40),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
