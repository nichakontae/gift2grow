import 'package:flutter/material.dart';

class DonateHistory extends StatefulWidget {
  const DonateHistory({super.key});

  @override
  State<DonateHistory> createState() => _DonateHistoryState();
}

class _DonateHistoryState extends State<DonateHistory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "Ban Nong Phluang Noi School",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Divider(
                        color: Color(0xff9468AC),
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Tracking:  ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "TH123702394091",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9468AC)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Date:  ",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "12 July 2021",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9468AC)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
