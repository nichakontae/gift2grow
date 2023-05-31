import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.color,required this.text, required this.onTap, this.paddingHorizontal}) : super(key: key);
  final String color;
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
          gradient: color == "primary" ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.primary.withOpacity(0.7)],
          ): null,
          color: color == "primary" ? null : Theme.of(context).colorScheme.tertiary,
        ),
        child: Center(
          child: Container(
            padding: paddingHorizontal,
            child: Text(text,
              style: TextStyle(
                fontSize: 18,
                color: color == "primary" ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ),
    );

  }
}
