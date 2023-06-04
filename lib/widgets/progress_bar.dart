import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, required this.trackingNumber, required this.completedAmount});
  final int trackingNumber;
  final int completedAmount;
  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    // final tracking = widget.trackingNumber;
    // final completed = widget.completedAmount;
    return  Container(
      width: double.infinity,
     

      padding: EdgeInsets.zero,
      child:   ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearPercentIndicator(
            barRadius: const Radius.circular(16),
            center:  Text("${widget.trackingNumber}/${widget.completedAmount}", style: const TextStyle(color: Colors.white, fontFamily: "Poppins-Medium"),),
            animation: true,
            lineHeight: 25.0,
            animationDuration: 500,
            percent: widget.trackingNumber/widget.completedAmount,
            progressColor: const Color(0xFF9468AC),
          ),
            
          ),
    );
  }
}