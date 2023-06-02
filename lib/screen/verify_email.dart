import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/screen/home.dart';
import 'package:gift2grow/screen/login.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // user need to be create before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      // timer = Timer.periodic(Duration(seconds: 5), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }

  // Future checkEmailVerified() async {
  //   // call after email verification
  //   await FirebaseAuth.instance.currentUser!.reload();
  //
  //   setState(() {
  //     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  //   });
  //
  //   if(isEmailVerified) timer?.cancel();
  // }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomePage()
      : Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logo/mail.png",
                        scale: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "We've send an email to ${widget!.email} to verify your email address and activate your account.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          color: "primary",
                          text: "Resend Email",
                          onTap: () {
                            canResendEmail ? sendVerificationEmail : null;
                          }),
                      ElevatedButton(
                        style: ButtonStyle(),
                          onPressed:
                              canResendEmail ? sendVerificationEmail : null,
                          child: Text("Resend Email")),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          color: "secondary",
                          text: "Cancel",
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        );
}
