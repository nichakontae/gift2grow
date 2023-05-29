import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.type,required this.text, required this.onTap, this.paddingHorizontal}) : super(key: key);
  final String type;
  final String text;
  final Function onTap;
  final EdgeInsetsGeometry? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: type == "primary" ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withOpacity(0.7)],
          ): null,
          color: type == "primary" ? null : const Color(0xFFD9D9D9),
        ),
        child: Center(
          child: Container(
            padding: paddingHorizontal,
            child: Text(text,
              style: TextStyle(
                fontSize: 18,
                color: type == "primary" ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );

  }
}
