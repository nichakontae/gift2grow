import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/authentication/login_controller.dart';
import 'package:gift2grow/screen/authentication/forgot_password.dart';
import 'package:gift2grow/screen/authentication/resgister.dart';
import 'package:gift2grow/screen/authentication/verify_email.dart';
import 'package:gift2grow/widgets/theme_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  String errorMessage = "";
  final LoginTextEditController _loginController = LoginTextEditController();

  void navigate(String email) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => VerifyEmailPage(email: email)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Theme.of(context).colorScheme.secondary, Colors.white])),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/logo/logo7@2x.png"),
                        radius: 120,
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _loginController.emailController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                  setState(() => errorMessage = "");
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Type your email"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _loginController.passwordController,
                              obscureText: passwordVisible,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() => errorMessage = "");
                                  return 'Please enter password';
                                } else if (value.length < 8) {
                                  setState(() => errorMessage = "");
                                  return "Password must be at least 8 characters long";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Type your password"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordPage()));
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Visibility(
                        visible: errorMessage != "" ? true : false,
                        child: const SizedBox(
                          height: 20,
                        ),
                      ),

                      Visibility(
                        visible: errorMessage != "" ? true : false,
                        child: Row(
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
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            color: "primary",
                            text: "Login",
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      content: SizedBox(
                                        height: 120,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircularProgressIndicator(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Text("Loading..."),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                  // UserCredential user =
                                  await FirebaseAuth
                                      .instance
                                      .signInWithEmailAndPassword(
                                          email: _loginController.email,
                                          password: _loginController.password);

                                  // for store password
                                 // await UserProvider.setKeySpecialCase();
                                 //
                                 //  UserProvider.setUserDetails(
                                 //      userId: user.user!.uid,
                                 //      password: _loginController.password);
                                 //
                                 //  UserProvider.storeData(key: "password", value: _loginController.password);
                                  // for store password

                                  navigate(_loginController.email);

                                  debugPrint("successfully login");
                                } on FirebaseAuthException catch (e) {
                                  Navigator.of(context).pop();
                                  if (e.code == 'user-not-found') {
                                    setState(() {
                                      errorMessage = "User not found";
                                    });
                                    debugPrint('No user found for that email');
                                  } else if (e.code == 'wrong-password') {
                                    setState(() {
                                      errorMessage = "Wrong password";
                                    });
                                    debugPrint(
                                        'wrong password provided for that user');
                                  }
                                }
                              }
                            },
                            paddingHorizontal:
                                const EdgeInsets.symmetric(horizontal: 60),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                            child: const Text(
                              "Create",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
