import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage2 extends StatelessWidget {
  const ResultsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacer(multiplier: 3),
        CustomNetworkImage(
          width: Get.width * .5,
          height: Get.width * .5,
          imageUrl: 'https://picsum.photos/800/800',
          radius: Get.width,
          border: Border.all(
            color: AppColors.beigeWithOpacity,
            width: 8,
          ),
        ),
        CustomSpacer(multiplier: 3),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.bigLateralPaddingValue * 2),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Green/EFA ',
                style: AppTexts.customTextStyle(AppTextType.title,
                    color: Colors.green),
                children: [
                  TextSpan(
                    text:
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    style: AppTexts.customTextStyle(AppTextType.title),
                  ),
                ],
              )),
        ),
        CustomSpacer(multiplier: 3),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.bigLateralPaddingValue * 2),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'You both agreed on',
                style: AppTexts.customTextStyle(
                  AppTextType.regular,
                ),
                children: [
                  TextSpan(
                    text: ' 68% ',
                    style: AppTexts.customTextStyle(AppTextType.regular,
                        color: Colors.green, bold: true),
                  ),
                  TextSpan(
                    text: '\n of all the statements you swiped on. ',
                    style: AppTexts.customTextStyle(AppTextType.regular),
                  ),
                ],
              )),
        ),
        CustomSpacer(multiplier: 4),
        AppTexts.regular('In June, bla bla bla'),
        CustomSpacer(multiplier: 4),
      ],
    );
  }
}
