import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressBar extends StatelessWidget {
  final int step;
  final int totalSteps;

  const CustomProgressBar({
    super.key,
    required this.step,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final width = Get.width * 0.35;
    return SizedBox(
      width: width,
      height: 8,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: width * (step / totalSteps),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
