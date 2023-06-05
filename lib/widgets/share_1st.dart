// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:gift2grow/widgets/profile_frame1st.dart';

class Share_1st extends StatelessWidget {
  const Share_1st({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF9569AC),
            Color(0xFFFFFAEF),
          ],
          stops: [0, 0.74],
        )),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 74, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ranking",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Text(
                    "You are in #1st",
                    style: TextStyle(
                        fontSize: 29,
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 100, 98, 98),
                            offset: Offset(0, 2),
                            blurRadius: 9,
                          ),
                        ],
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 80, 8, 85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 2.2, // Adjust the scale factor as needed
                          child: Profile1st(),
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                      child: Column(
                        children: [
                          Text('BenHann',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF9468AC))),
                          Text('999 TAMBOON',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF9468AC))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '"You have made a total of 120 donations"',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFC107))),
                          ),
                          Text(
                            'For truly we are all angels',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9468AC),
                            ),
                          ),
                          Text(
                            'temporarily hiding as humans.',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9468AC),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.height * 0.189,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/Cloud_right.png',
                      scale: 1,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/images/Cloud_left.png',
                      scale: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
