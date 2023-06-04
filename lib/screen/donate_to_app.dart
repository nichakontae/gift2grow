import 'package:flutter/material.dart';

class DonateToApp extends StatefulWidget {
  const DonateToApp({super.key});

  @override
  State<DonateToApp> createState() => _DonateToAppState();
}

class _DonateToAppState extends State<DonateToApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift2Grow'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.7)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/Donation.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Support Us!",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset('assets/images/donate_to_app.png')),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
