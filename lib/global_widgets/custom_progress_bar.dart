import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class CustomProgressBar extends StatelessWidget {
  final int step;
  final int totalSteps;
  final double width;
  final Color? progressColor;
  final Color? backgroundColor;
  final bool isDotted;
  final Function()? onSkipTap;

  const CustomProgressBar({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.width,
    this.progressColor,
    this.backgroundColor,
    this.isDotted = false,
    this.onSkipTap,
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
                              color: Colors.white.withOpacity(.5),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        if (i == step)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                      ],
                    ),
                  ),
                ),
              if (onSkipTap != null)
                InkWell(
                  onTap: onSkipTap,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: AppDimens.bigLateralPaddingValue),
                    child: AppTexts.regular(
                      S.of(context).skip.toUpperCase(),

                      // style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
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
