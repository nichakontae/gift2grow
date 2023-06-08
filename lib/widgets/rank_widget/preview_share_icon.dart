import 'package:flutter/material.dart';

class PreviewShareIcon extends StatelessWidget {
  const PreviewShareIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 15,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  //color: Colors.black,
                  color: Colors.black.withOpacity(0.25), // Shadow color
                  blurRadius: 1, // Spread radius
                  offset: const Offset(1, 2), // Offset in x and y directions
                ),
              ],
            ),
            child: GestureDetector(
              onTap: ()async{
              },
              child: Image.asset(
                'assets/icon/download.png',
                scale: 12,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 20,
          child: Image.asset(
            'assets/icon/facebook.png',
            scale: 12,
          ),
        ),
        Positioned(
          bottom: 14,
          left: 75,
          child: Image.asset(
            'assets/icon/twitter.png',
            scale: 11.9,
          ),
        ),
        Positioned(
          bottom: 13.5,
          left: 130,
          child: Image.asset(
            'assets/icon/instagram.png',
            scale: 11.5,
          ),
        ),
      ],
    );
  }
}
