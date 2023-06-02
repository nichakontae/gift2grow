import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/screen/check_email_reset_password.dart';
import 'package:gift2grow/widgets/background_gradient.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  bool canNavigate = true;

  Future sendResetPasswordEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      canNavigate = true;
    } catch (e) {
      canNavigate = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^\w+@(\w+\.)+\w{2,4}$')
                                        .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                // เหลือเช็คว่าemail นี้มีในระบบมั้ย
                                return null;
                              },
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  hintText: "Type your email"),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                              color: "secondary",
                              text: "Back to Login",
                              onTap: () {
                                Navigator.pop(context);
                              },
                              paddingHorizontal:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            CustomButton(
                              color: "primary",
                              text: "Confirm",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  sendResetPasswordEmail();
                                  canNavigate
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CheckEmail()))
                                      : null;
                                  debugPrint(
                                      "sent email to reset password successfully");
                                }
                              },
                              paddingHorizontal:
                                  const EdgeInsets.symmetric(horizontal: 40),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
