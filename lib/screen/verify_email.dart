import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/screen/home_test.dart';
import 'package:gift2grow/screen/login.dart';
import 'package:gift2grow/widgets/background_gradient.dart';
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

      timer = Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    // call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) timer?.cancel();
  }

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
      ? const HomePage()
      : BackgroundGradient(
        child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Container(
                         padding: const EdgeInsets.all(25),
                         decoration: const BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.all(Radius.circular(25))),
                         child: Column(
                           children: [
                             Image.asset(
                               "assets/logo/mail.png",
                               scale: 2,
                             ),
                             const SizedBox(
                               height: 20,
                             ),
                             RichText(
                               textAlign: TextAlign.center,
                               text: TextSpan(
                                 style: const TextStyle(
                                     color: Colors.black, fontFamily: "Poppins"),
                                 children: [
                                   const TextSpan(
                                     text: "We've sent an email to ",
                                   ),
                                   TextSpan(
                                     text: widget!.email,
                                     style: const TextStyle(
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   const TextSpan(text: " to verify"),
                                   const TextSpan(
                                       text:
                                       " your email address and activate your account.")
                                 ],
                               ),
                             ),
                             const SizedBox(
                               height: 40,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [

                                 CustomButton(
                                     paddingHorizontal:
                                     const EdgeInsets.symmetric(horizontal: 50),
                                     color: "secondary",
                                     text: "Cancel",
                                     onTap: () {
                                       FirebaseAuth.instance.signOut();
                                       Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                             builder: (context) =>
                                             const LoginPage()),);
                                     }),
                                 CustomButton(
                                   color: "primary",
                                   text: "Resend Email",
                                   onTap:
                                   canResendEmail ? sendVerificationEmail : null,
                                   paddingHorizontal:
                                   const EdgeInsets.symmetric(horizontal: 30),
                                 ),
                               ],
                             )
                           ],
                         ),
                       )
                      ],
                    ),
                  )
                ],
              ),
      );
}
