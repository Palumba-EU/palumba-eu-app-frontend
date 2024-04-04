import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int step;
  final int totalSteps;
  final double width;
  final Color? progressColor;
  final Color? backgroundColor;

  const CustomProgressBar(
      {super.key,
      required this.step,
      required this.totalSteps,
      required this.width,
      this.progressColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 8,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: width * (step / totalSteps),
            decoration: BoxDecoration(
                color: progressColor ?? Colors.white,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
