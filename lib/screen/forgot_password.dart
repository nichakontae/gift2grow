import 'package:flutter/material.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.7),
            Theme.of(context).colorScheme.primary
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
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
                          SizedBox(
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
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
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
                          SizedBox(
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
                                onTap: () {
                                  if(_formKey.currentState!.validate()){
                                    debugPrint("sent email to reset passsword successfully");
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
      ),
    );
  }
}
