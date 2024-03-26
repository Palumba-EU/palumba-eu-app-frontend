import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/data/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: onPressed == null,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 17.5, vertical: 15),
            backgroundColor: AppColors.beigeWithOpacity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
            ),
            side: BorderSide(
                width: AppDimens.borderWidth,
                color: AppColors.beigeWithOpacity),
          ),
          child: Opacity(
            opacity: onPressed == null ? 0.25 : 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTexts.regular(text, bold: true),
                CustomHorizontalSpacer(),
                SvgPicture.asset('assets/images/ic_arrow_forward.svg')
              ],
            ),
          )),
    );
  }
}
