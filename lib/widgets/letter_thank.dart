import 'package:flutter/material.dart';
import 'package:gift2grow/screen/bottom_navbar.dart';

class LetterThank extends StatefulWidget {
  const LetterThank({super.key, required this.letterOfThank});

  final String letterOfThank;

  @override
  State<LetterThank> createState() => _LetterThankState();
}

class _LetterThankState extends State<LetterThank> {
  @override
  Widget build(BuildContext context) {
    return Stack(
    alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0,0, 20.0, 50 ),
          child:
          Container(
            padding:
                const EdgeInsets.fromLTRB(25,20,25,55),
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
            width: double.infinity,
            child: Column(children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thank You",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Color(0xFFFF5A79),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(widget.letterOfThank,
                  style: const TextStyle(color: Colors.grey, fontSize: 16))
            ]),
          ),
          
        ),
      Container(
        padding: const EdgeInsets.fromLTRB(30,100,30,0),
        width: double.infinity,
        child: 
      
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
              const Image(image: AssetImage("assets/images/gift.png"), width: 100, height: 100,),
            const  SizedBox(width: 10,),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  SizedBox(height: 55,),
            const Text("If you want to Support us"),
             GestureDetector(
              child: const Text("click here", style: TextStyle(color: Color(0xFF9468AC)),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyBottomNavbar(
                    screen: 2
                  
                  ))
                );
              },
             )
             
          ],
        )
        ],
      )
      ),
       
      ],
    );
  }
}
