import 'package:flutter/material.dart';

import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CustomSelector extends StatelessWidget {
  final Widget? leading;
  final String title;
  final bool selected;
  final VoidCallback? onPressed;

  const CustomSelector({
    Key? key,
    this.leading,
    required this.title,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.regularLateralPaddingValue, vertical: 19),
          backgroundColor: selected ? AppColors.beigeWithOpacity : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.largeBorderRadius),
          ),
          side: BorderSide(
              width: AppDimens.borderWidth,
              color:
                  selected ? AppColors.beigeWithOpacity : Colors.transparent),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading != null
                ? Padding(
                    padding: EdgeInsets.only(
                        right: AppDimens.regularLateralPaddingValue),
                    child: leading,
                  )
                : const SizedBox.shrink(),
            Expanded(child: AppTexts.regular(title, bold: selected)),
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
