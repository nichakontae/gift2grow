import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/donate_history.dart';
import '../utilities/caller.dart';
import '../widgets/profile_widgets/history_section.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final User? user = auth.currentUser;
    final uid = user!.uid;
    setState(() {
      getDonateHistory(uid);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DonateHistoryDetail>? donateHistory;
  Future<void> getDonateHistory(uid) async {
    try {
      final response = await Caller.dio.get(
        '/profile/getDonateHistory?userId=$uid',
      );
      setState(() {
        donateHistory = List.generate(
            response.data.length,
            (index) => DonateHistoryDetail(
                  campaignId: response.data[index]['campaign']['id'],
                  trackingNumber: response.data[index]['tracking_number'],
                  donatedAt: response.data[index]['donation_date'],
                  schoolName: response.data[index]['campaign']['school_name'],
                ));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (donateHistory == null) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF9468AC), Color.fromARGB(255, 255, 255, 255)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    }
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
            for (var i = 0; i < donateHistory!.length; i++)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: DonateHistory(
                  donateHistory: donateHistory![i],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
