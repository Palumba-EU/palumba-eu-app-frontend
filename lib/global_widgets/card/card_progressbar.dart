import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

class CardProgressBar extends StatelessWidget {
  final int step;
  final int totalSteps;

  const CardProgressBar({
    super.key,
    required this.step,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < totalSteps; i++)
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: DUI.spacing.smallPaddingValue * .5),
            child: SizedBox(
              width: double.infinity,
              height: 6,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  if (i == step)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                ],
              ),
            ),
          ),
        ),
      InkWell(
        onTap: () {
          //TODO: Implement Skip
        },
        child: Padding(
          padding: EdgeInsets.only(left: DUI.spacing.lateralPaddingValue),
          child: DUI.text.regular(context, 'SKIP', color: AppColors.text),
        ),
      )
    ]);
  }
}
