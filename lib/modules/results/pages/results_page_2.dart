import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
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
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: CustomNetworkImage(
                  width: Get.width * .65,
                  height: Get.width * .65,
                  isSvg: true,
                  imageUrl:
                      controller.maxPercentagePoliticParty?.party.logo ?? '',
                  radius: Get.width,
                  color: AppColors.blue,
                ),
              ),
              Image.asset(
                'assets/images/palumba_badge_heart.png',
                height: 100,
                fit: BoxFit.fitWidth,
              )
            ],
          ),
          CustomSpacer(multiplier: 2),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.bigLateralPaddingValue * 2),
            child: controller.maxPercentagePoliticParty == null
                ? AppTexts.title('No results found', color: AppColors.primary)
                : RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          '${controller.maxPercentagePoliticParty?.party.name ?? ''} ',
                      style: AppTexts.customTextStyle(AppTextType.title,
                          color: controller.getFirstPartyColor()),
                      children: [
                        TextSpan(
                          text: S.of(context).resultsPage2Title,
                          style: AppTexts.customTextStyle(AppTextType.title,
                              color: AppColors.primary),
                        ),
                      ],
                    )),
          ),
          CustomSpacer(multiplier: 3),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.bigLateralPaddingValue * 2),
            child: controller.maxPercentagePoliticParty == null
                ? AppTexts.regular('No data', color: AppColors.primary)
                : RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: S.of(context).resultsPage2FirstText,
                      style: AppTexts.customTextStyle(AppTextType.regular,
                          color: AppColors.primary),
                      children: [
                        TextSpan(
                          text:
                              ' ${controller.maxPercentagePoliticParty?.percentage}% ',
                          style: AppTexts.customTextStyle(AppTextType.regular,
                              color: controller.getFirstPartyColor(),
                              bold: true),
                        ),
                        TextSpan(
                          text: '\n  ${S.of(context).resultsPage2LastText}',
                          style: AppTexts.customTextStyle(AppTextType.regular,
                              color: AppColors.primary),
                        ),
                      ],
                    )),
          ),
          CustomSpacer(multiplier: 4),
          //TODO: fix this quote
          AppTexts.regular('In June, bla bla bla', color: AppColors.primary),
          CustomSpacer(multiplier: 12),
        ],
      ),
    );
  }
}
