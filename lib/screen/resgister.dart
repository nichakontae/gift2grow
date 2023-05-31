import 'package:flutter/material.dart';
import 'package:gift2grow/models/register_controller.dart';
import 'package:gift2grow/widgets/background_gradient.dart';
import 'package:gift2grow/widgets/register_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final RegisterTextEditController _registerController =
      RegisterTextEditController();

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
                        RegisterTextFormField(
                            controller: _registerController.usernameController,
                            validate: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r'^[A-Za-z]\\w{5, 29}$')
                                      .hasMatch(value)) {
                                return "Please fill out valid user name";
                                // อย่าลืมใส่คำที่ดีกว่านี้
                              }
                            },
                            hintText: "Username"),
                        RegisterTextFormField(
                            controller: _registerController.firstnameController,
                            validate: (value) {},
                            hintText: "First Name"),
                        RegisterTextFormField(
                            controller: _registerController.lastnameController,
                            validate: (value) {},
                            hintText: "Last Name"),
                        RegisterTextFormField(
                            controller: _registerController.emailController,
                            validate: (value) {},
                            hintText: "Email")
                      ],
                    ),
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
