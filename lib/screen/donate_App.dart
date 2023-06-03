import 'package:flutter/material.dart';

class DonateApp extends StatefulWidget {
  const DonateApp({super.key});

  @override
  State<DonateApp> createState() => _DonateAppState();
}

class _DonateAppState extends State<DonateApp> {
  @override
  Widget build(BuildContext context) {
    return const Text("Donate jaa plss3",
    style: TextStyle(fontFamily: AutofillHints.addressCity),
    );
  }
}