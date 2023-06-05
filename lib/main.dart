import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/screen/forgot_password.dart';
//import 'package:gift2grow/screen/home.dart';
import 'package:gift2grow/screen/login.dart';
import 'package:gift2grow/screen/notification.dart';
import 'package:gift2grow/screen/resgister.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

//background event handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void _firebaseMessagingForegroundHandler(RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //background event handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //foreground event handler
  FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);

  //Request permission
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  //Handle token
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("FCM token:$fcmToken");
  //store token to db

  runApp(const Gift2Grow());
}

class Gift2Grow extends StatefulWidget {
  const Gift2Grow({super.key});

  @override
  State<Gift2Grow> createState() => _Gift2GrowState();
}

class _Gift2GrowState extends State<Gift2Grow> {
  User? user;

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenTerminated(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenBackground);
  }

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      setState(() {
        user = newUser;
      });
    });
    setupInteractedMessage();
  }

  void _handleMessageOpen(RemoteMessage message) {}
  void _handleMessageOpenTerminated(RemoteMessage message) {
    print('message from app that was terminated');
    _handleMessageOpen(message);
  }

  void _handleMessageOpenBackground(RemoteMessage message) {
    print('message from app that was in background');
    _handleMessageOpen(message);
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
        '/home': (context) => const NotificationPage(),
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
