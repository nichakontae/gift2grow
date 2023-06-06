import 'package:flutter/material.dart';

class RegisterTextEditController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String get username => usernameController.text;

  set username(String value) => usernameController.text = value;

  String get firstname => firstnameController.text;

  set firstname(String value) => firstnameController.text = value;

  String get lastname => lastnameController.text;

  set lastname(String value) => lastnameController.text = value;

  String get email => emailController.text;

  set email(String value) => emailController.text = value;

  String get password => passwordController.text;

  set password(String value) => passwordController.text = value;

  String get confirmPassword => confirmPasswordController.text;

  set confirmPassword(String value) => confirmPasswordController.text = value;

  void dispose() {
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}