import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int step;
  final int totalSteps;
  final double width;
  final Color? progressColor;
  final Color? backgroundColor;
  final bool isDotted;

  const CustomProgressBar({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.width,
    this.progressColor,
    this.backgroundColor,
    this.isDotted = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: isDotted ? null : 8,
      child: isDotted
          ? Row(children: [
              for (int i = 0; i < totalSteps; i++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Stack(
                      children: [
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: backgroundColor ??
                                  Colors.white.withOpacity(.5),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        if (i == step)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 4,
                            decoration: BoxDecoration(
                                color: progressColor ?? Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                      ],
                    ),
                  ),
                ),
            ])
          : Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: backgroundColor ?? Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(10)),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: (width) * (step / totalSteps),
                  decoration: BoxDecoration(
                      color: progressColor ?? Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
    );
  }
}
