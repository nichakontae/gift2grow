import 'package:flutter/material.dart';

class ShowLevelQuote extends StatelessWidget {
  final int tamboonPoint;

  const ShowLevelQuote({Key? key, required this.tamboonPoint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tamboonPoint >= 0 && tamboonPoint <= 100
        ? RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9468AC),
              ),
              children: [
                TextSpan(
                  text: 'I float my words like dandelions,\n',
                ),
                TextSpan(
                  text: 'parachuting memories of warm\n',
                ),
                TextSpan(
                  text: 'summer days.',
                ),
              ],
            ),
          )
        : (tamboonPoint > 100 && tamboonPoint <= 250)
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9468AC),
                    ),
                    children: [
                      TextSpan(
                        text: 'Let the angels light your way.',
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9468AC),
                    ),
                    children: [
                      TextSpan(
                        text: 'For truly we are all angels\n',
                      ),
                      TextSpan(
                        text: 'temporarily hiding as humans.',
                      ),
                    ],
                  ),
                ),
              );
  }
}
