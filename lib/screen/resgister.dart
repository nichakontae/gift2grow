import 'package:flutter/material.dart';
import 'package:gift2grow/models/register_controller.dart';
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
                        const SizedBox(height: 20,),
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
                        const SizedBox(height: 20,),
                        RegisterTextFormField(
                            controller: _registerController.firstnameController,
                            validate: (value) {},
                            hintText: "First Name"),
                        const SizedBox(height: 20,),
                        RegisterTextFormField(
                            controller: _registerController.lastnameController,
                            validate: (value) {},
                            hintText: "Last Name"),
                        const SizedBox(height: 20,),
                        RegisterTextFormField(
                            controller: _registerController.emailController,
                            validate: (value) {},
                            hintText: "Email"),
                        const SizedBox(height: 20,),
                        PasswordTextFormField(
                            passwordVisible: password,
                            controller: _registerController.passwordController,
                            validate: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$')
                                      .hasMatch(value)) {
                                return 'Please enter a valid password';
                              }
                              return null;
                            },
                            hintText: "Password"),
                        const SizedBox(height: 20,),
                        ConfirmPasswordFormField(
                            passwordController:
                                _registerController.passwordController,
                            hintText: "Confirm password"),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(color: "secondary", text: "Back to Login", onTap: (){},paddingHorizontal: const EdgeInsets.symmetric(horizontal: 20),),
                            CustomButton(color: "primary", text: "Confirm", onTap: (){},paddingHorizontal: const EdgeInsets.symmetric(horizontal: 40),)
                          ],
                        ),
                        const SizedBox(height: 40,),
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