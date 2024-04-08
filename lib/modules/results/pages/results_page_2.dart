import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage2 extends GetView<ResultsController> {
  const ResultsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomSpacer(multiplier: 3),
          CustomNetworkImage(
            width: Get.width * .5,
            height: Get.width * .5,
            isSvg: true,
            imageUrl: controller.getFisrtParty()?.logo ?? '',
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
                  text: '${controller.getFisrtParty()?.name ?? 'No data '} ',
                  style: AppTexts.customTextStyle(AppTextType.title,
                      color: controller.getFirstPartyColor()),
                  children: [
                    TextSpan(
                      text: S.of(context).resultsPage2Title,
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
                  text: S.of(context).resultsPage2FirstText,
                  style: AppTexts.customTextStyle(
                    AppTextType.regular,
                  ),
                  children: [
                    TextSpan(
                      text: ' 68% ',
                      //' ${controller.getFisrtParty()?.value}', //TODO: put api data ,
                      style: AppTexts.customTextStyle(AppTextType.regular,
                          color: controller.getFirstPartyColor(), bold: true),
                    ),
                    TextSpan(
                      text: '\n  ${S.of(context).resultsPage2LastText}',
                      style: AppTexts.customTextStyle(AppTextType.regular),
                    ),
                  ],
                )),
          ),
          CustomSpacer(multiplier: 4),
          AppTexts.regular('In June, bla bla bla'),
          CustomSpacer(multiplier: 12),
        ],
      ),
    );
  }
}
