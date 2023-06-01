import 'package:flutter/material.dart';

import '../widgets/profile_widgets/history_section.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF9468AC), Color.fromARGB(255, 255, 255, 255)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            for (var i = 0; i < 12; i++)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: const DonateHistory(),
              ),
          ],
        ),
      ),
    );
  }
}
