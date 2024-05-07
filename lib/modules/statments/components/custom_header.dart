import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
  final RxBool isBackButtonActive;

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
              Obx(
                () => Opacity(
                  opacity: isBackButtonActive.value ? 1 : 0,
                  child: Transform.rotate(
                    angle: -pi * .06,
                    child: InkWell(
                      onTap: backTap,
                      child: Container(
                        height: 32,
                        width: 40,
                        margin: EdgeInsets.only(
                            top: AppDimens.smallLateralPaddingValue * 1.5),
                        decoration: BoxDecoration(
                          color: AppColors.lightPrimary,
                          borderRadius: BorderRadius.circular(
                              AppDimens.largeBorderRadius),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(
                                'assets/images/ic_arrow_back.svg')),
                      ),
                    ),
                  ),
                ),
              ),
              AppTexts.title(S.of(context).shortAppName,
                  fontSize: 32, color: AppColors.primary),
              InkWell(
                onTap: homeTap,
                child: Transform.rotate(
                  angle: pi * .06,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: AppDimens.smallLateralPaddingValue * 1.5),
                    height: 32,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.lightPrimary,
                      borderRadius:
                          BorderRadius.circular(AppDimens.largeBorderRadius),
                    ),
                    child: Transform.rotate(
                      angle: -pi * .06,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: SvgPicture.asset('assets/images/ic_home.svg')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomSpacer(multiplier: 2),
      ],
    );
  }
}
