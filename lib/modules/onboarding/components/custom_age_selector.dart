import 'package:flutter/material.dart';

import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CustomAgeSelector extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onPressed;

  const CustomAgeSelector({
    Key? key,
    required this.title,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.regularLateralPaddingValue),
            backgroundColor: selected ? AppColors.yellow : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
            ),
            side: BorderSide(
                width: AppDimens.borderWidth,
                color: selected ? AppColors.lightYellow : Colors.transparent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTexts.regular(title, bold: selected, color: AppColors.primary),
              CustomHorizontalSpacer(),
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.primary : Colors.transparent),
              ),
            ],
          ));
    }

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.all(10),
      ),
      child: AppTexts.regular(title, color: AppColors.primary),
    );
  }
}
