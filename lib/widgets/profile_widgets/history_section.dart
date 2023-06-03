import 'package:flutter/material.dart';
import 'package:gift2grow/models/donate_history.dart';

class DonateHistory extends StatefulWidget {
  const DonateHistory({super.key, this.donateHistory});
  final DonateHistoryDetail? donateHistory;

  @override
  State<DonateHistory> createState() => _DonateHistoryState();
}

class _DonateHistoryState extends State<DonateHistory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey
                    .withOpacity(0.5), //Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                offset: const Offset(0.0, 3.0), //(x,y)
                blurRadius: 7.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.school,
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.donateHistory!.schoolName,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Divider(
                    color: Color(0xff9468AC),
                    thickness: 1,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Tracking:  ",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.donateHistory!.trackingNumber,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff9468AC)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Date:  ",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.donateHistory!.donatedAt,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff9468AC)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
