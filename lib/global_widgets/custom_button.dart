import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconButtonParameters? suffixIcon;
  final IconButtonParameters? prefixIcon;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final bool bold;
  final ButtonBorderParameters? border;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.suffixIcon,
    this.prefixIcon,
    this.radius,
    this.color,
    this.textColor,
    this.bold = true,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: onPressed == null,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.regularLateralPaddingValue, vertical: 15),
            backgroundColor: color ?? AppColors.beigeWithOpacity,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(radius ?? AppDimens.borderRadius),
            ),
            side: BorderSide(
                width: border?.width ?? AppDimens.borderWidth,
                style: border == null ? BorderStyle.none : BorderStyle.solid,
                strokeAlign: border?.isOutside ?? false
                    ? BorderSide.strokeAlignOutside
                    : BorderSide.strokeAlignInside,
                color: AppColors.beigeWithOpacity),
          ),
          child: Opacity(
            opacity: onPressed == null ? 0.25 : 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomHorizontalSpacer(small: true),
                if (prefixIcon != null)
                  SvgPicture.asset(
                    'assets/images/${prefixIcon!.asset}.svg',
                    height: prefixIcon!.size,
                    colorFilter: prefixIcon!.color == null
                        ? null
                        : ColorFilter.mode(prefixIcon!.color!, BlendMode.srcIn),
                  ),
                if (prefixIcon != null) CustomHorizontalSpacer(),
                AppTexts.regular(text, bold: bold, color: textColor),
                if (suffixIcon != null) CustomHorizontalSpacer(),
                if (suffixIcon != null)
                  SvgPicture.asset(
                    'assets/images/${suffixIcon!.asset}.svg',
                    height: suffixIcon!.size,
                    colorFilter: suffixIcon!.color == null
                        ? null
                        : ColorFilter.mode(suffixIcon!.color!, BlendMode.srcIn),
                  ),
                CustomHorizontalSpacer(small: true),
              ],
            ),
          )),
    );
  }
}

class IconButtonParameters {
  final String asset;
  final double? size;
  final Color? color;

  IconButtonParameters(
    this.asset, {
    this.size,
    this.color,
  });
}

class ButtonBorderParameters {
  final Color? color;
  final double? width;
  final bool? isOutside;

  ButtonBorderParameters({this.color, this.width, this.isOutside});
}
