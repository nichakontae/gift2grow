import 'package:flutter/material.dart';

class LetterThankNoEvidence extends StatelessWidget {
  const LetterThankNoEvidence({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 15),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4), // Shadow color
                    blurRadius: 10.0, // Spread radius
                    offset: const Offset(0, 0.25), // Shadow offset
                  ),
                ],
                borderRadius: BorderRadius.circular(50.0)),
            child: const Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thank You for your donation!",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Thank you for your kind-heartedness and for joining us in this meaningful campaign. Together, we are making a positive difference and fostering a brighter future for these children.",
                style: TextStyle(color: Color(0xFF9D9D9D)),
              )
            ]),
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "*The school will send a picture of the items received including a thank you letter  within 7 days.",
                    style: TextStyle(
                      color: Color(0xFFDB6363),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
      ],
    );
  }
}
