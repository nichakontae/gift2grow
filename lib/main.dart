import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/screen/authentication/forgot_password.dart';
import 'package:gift2grow/screen/authentication/login.dart';
import 'package:gift2grow/screen/donate_history.dart';
import 'package:gift2grow/screen/donate_to_app.dart';
import 'package:gift2grow/screen/bottom_navbar.dart';
import 'package:gift2grow/screen/profile_page.dart';
import 'package:gift2grow/screen/authentication/resgister.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Gift2Grow());
}

class Gift2Grow extends StatefulWidget {
  const Gift2Grow({super.key});

  @override
  State<Gift2Grow> createState() => _Gift2GrowState();
}

class _Gift2GrowState extends State<Gift2Grow> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      setState(() {
        user = newUser;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: user == null ? '/login' : '/home',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/home': (context) => const MyBottomNavbar(
              screen: 0,
            ),
        '/profile': (context) => const ProfilePage(),
        '/donatetoapp': (context) => const DonateToApp(),
        '/donatehistory': (context) => const HistoryPage(),
      },
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color(0xFF9468AC),
          secondary: const Color(0xFFFECE6B),
          tertiary: const Color(0xFFD9D9D9),
        ),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
    );
  }
}
