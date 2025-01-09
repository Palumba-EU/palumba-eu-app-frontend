import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

// ignore: must_be_immutable
class CustomHeader extends StatelessWidget {
  CustomHeader({
    super.key,
    this.homeTap,
    this.backTap,
    required this.isBackButtonActive,
  });

  Function()? homeTap;
  Function()? backTap;
  final bool isBackButtonActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacer(multiplier: 3),
        Padding(
          padding: AppDimens.lateralPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBackButtonActive
                  ? backButton(32, 40)
                  : Container(height: 32, width: 40),
              AppTexts.title(S.of(context).shortAppName,
                  forceCaprasimo: true, fontSize: 32, color: AppColors.primary),
              homeButton(),
            ],
          ),
        ),
        CustomSpacer(multiplier: 2),
      ],
    );
  }

  Widget backButton(double height, double width) {
    return Transform.rotate(
      angle: -pi * .06,
      child: InkWell(
        onTap: backTap,
        child: Container(
          height: height,
          width: width,
          margin:
              EdgeInsets.only(top: AppDimens.smallLateralPaddingValue * 1.5),
          decoration: BoxDecoration(
            color: AppColors.lightPrimary,
            borderRadius: BorderRadius.circular(AppDimens.largeBorderRadius),
          ),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset('assets/images/ic_arrow_back.svg')),
        ),
      ),
    );
  }

  Widget homeButton() {
    return InkWell(
      onTap: homeTap,
      child: Transform.rotate(
        angle: pi * .06,
        child: Container(
          margin:
              EdgeInsets.only(top: AppDimens.smallLateralPaddingValue * 1.5),
          height: 32,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.lightPrimary,
            borderRadius: BorderRadius.circular(AppDimens.largeBorderRadius),
          ),
          child: Transform.rotate(
            angle: -pi * .06,
            child: Padding(
                padding: EdgeInsets.all(6),
                child: SvgPicture.asset('assets/images/ic_home.svg')),
          ),
        ),
      ),
    );
  }
}
