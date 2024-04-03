import 'package:flutter/material.dart';

import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CustomGenderSelector extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onPressed;

  const CustomGenderSelector({
    Key? key,
    required this.title,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.regularLateralPaddingValue, vertical: 15),
          backgroundColor: selected ? AppColors.beigeWithOpacity : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          ),
          side: BorderSide(
              width: AppDimens.borderWidth,
              color:
                  selected ? AppColors.beigeWithOpacity : Colors.transparent),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTexts.regular(title, bold: true),
            CustomHorizontalSpacer(),
            Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.beigeWithOpacity,
                      width: AppDimens.borderWidth),
                  color: selected ? AppColors.beige : Colors.transparent),
            ),
          ],
        ));
  }
}
