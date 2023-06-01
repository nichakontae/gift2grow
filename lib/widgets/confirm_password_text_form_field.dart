import 'package:flutter/material.dart';
class ConfirmPasswordFormField extends StatefulWidget {
  final TextEditingController passwordController;
  final String hintText;

  const ConfirmPasswordFormField({
    Key? key,
    required this.passwordController,
    required this.hintText,
  }) : super(key: key);

  @override
  _ConfirmPasswordFormFieldState createState() => _ConfirmPasswordFormFieldState();
}

class _ConfirmPasswordFormFieldState extends State<ConfirmPasswordFormField> {
  bool passwordVisible = true;
  ValueNotifier<bool> passwordMatchNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: passwordMatchNotifier,
      builder: (context, passwordMatch, _) {
        print(passwordMatch);
        final borderColor = passwordMatch ? Colors.green : Colors.red;
        return Builder(
          builder: (BuildContext context) {
            return TextFormField(
              obscureText: passwordVisible,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: borderColor,
                    width: 1.5
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  // borderSide: BorderSide(color: Colors.red,width: 8), // Set the border color
                ),
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              onChanged: (value) {
                final password = widget.passwordController.text;
                final confirmPassword = value;
                passwordMatchNotifier.value = password == confirmPassword;
                print("nofiy ${passwordMatchNotifier.value}");
              },
            );
          },
        );
      },
    );
  }
}
