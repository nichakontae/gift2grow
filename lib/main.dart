import 'package:flutter/material.dart';
import 'package:gift2grow/screen/check_email_reset_password.dart';
import 'package:gift2grow/screen/forgot_password.dart';
import 'package:gift2grow/screen/login.dart';
import 'package:gift2grow/screen/resgister.dart';
import 'package:gift2grow/widgets/theme_button.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const Gift2Grow());
}

class Gift2Grow extends StatelessWidget {
  const Gift2Grow({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color(0xFF9468AC),
          secondary: const Color(0xFFFECE6B),
          tertiary: const Color(0xFFD9D9D9)
        ),
    textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins')
      ),
      home: const LoginPage(),
    );
  }
}
