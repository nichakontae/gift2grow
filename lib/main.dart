import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/screen/authentication/forgot_password.dart';
import 'package:gift2grow/screen/authentication/login.dart';
import 'package:gift2grow/screen/complete_campaign.dart';
import 'package:gift2grow/screen/donate_history.dart';
import 'package:gift2grow/screen/donate_to_app.dart';
import 'package:gift2grow/screen/bottom_navbar.dart';
import 'package:gift2grow/screen/profile_page.dart';
import 'package:gift2grow/screen/authentication/resgister.dart';
import 'package:gift2grow/utilities/caller.dart';
import 'package:gift2grow/utilities/notification/getTrackingAmount.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

//background event handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

//foreground event handler
void _firebaseMessagingForegroundHandler(RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
}

void postUserToken() async {
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("FCM token:$fcmToken");
  try {
    var response = await Caller.dio.post('/noti/postUserToken', data: {
      'UserId': FirebaseAuth.instance.currentUser!.uid,
      'Token': fcmToken,
    });
    if (response.statusCode == 200) {
      print('Token posted successfully');
    } else {
      if (response.statusCode == 400) {
        print('Token already exists');
      }
      print('Token post failed');
    }
  } catch (e) {
    print(e);
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
  postUserToken();

  runApp(const Gift2Grow());
}

class Gift2Grow extends StatefulWidget {
  const Gift2Grow({Key? key}) : super(key: key);

  @override
  State<Gift2Grow> createState() => _Gift2GrowState();
}

class _Gift2GrowState extends State<Gift2Grow> {
  User? user;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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

  void _handleMessageOpen(RemoteMessage message) async {
    final campaignId = int.parse(message.data['CampaignId']);

    try {
      final trackingAmount = await getTrackingAmount(campaignId);

      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => CompletedCampaign(
            campaignId: campaignId,
            trackingAmount: trackingAmount,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

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
      navigatorKey: navigatorKey,
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
