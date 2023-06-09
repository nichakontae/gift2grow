import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField(
      {Key? key,
      required this.passwordVisible,
      required this.controller,
      required this.validate,
      required this.hintText})
      : super(key: key);
  final List<bool> passwordVisible;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final String hintText;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
    passwordVisible = widget.hintText == "Password"
        ? widget.passwordVisible[0]
        : widget.passwordVisible[1];
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      obscureText: passwordVisible,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off))),
    );
  }
}
