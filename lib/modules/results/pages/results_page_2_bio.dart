import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/pages/results_shared/results_heart_stack.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../../../global_widgets/custom_html_widget.dart';

class ResultsPage2Bio extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    bool isTablet = controller.isTablet;
    return Container(
      color: ElectionManager.currentElection.value.background,
      child: Stack(children: [
        HeartStack(),
        SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(multiplier: 3),
              SizedBox(
                height: Get.width * (isTablet ? .25 : .28),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CustomNetworkImage(
                        width: Get.width * (isTablet ? .22 : .25),
                        height: Get.width * (isTablet ? .22 : .25),
                        isSvg: true,
                        imageUrl:
                            controller.maxPercentagePoliticParty?.party.logo ??
                                '',
                        radius: Get.width,
                        color: AppColors.blue,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              CustomSpacer(multiplier: 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.largeLateralPaddingValue),
                child: controller.maxPercentagePoliticParty == null
                    ? AppTexts.title(S.of(context).resultsPage2NoResults,
                        color: AppColors.primary)
                    : Column(
                        children: [
                          AppTexts.title(
                              '${controller.maxPercentagePoliticParty?.party.name.split(" ")[0]}\'s Bio',
                              forceCaprasimo: true,
                              fontSize: 20,
                              color: AppColors.primary),
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomHtmlWidget(
                                content: controller.maxPercentagePoliticParty
                                        ?.party.profile?.bio
                                        ?.trim() ??
                                    "",
                                textStyle: AppTexts.customTextStyle(
                                    AppTextType.regular,
                                    color: AppColors.primary,
                                    fontSize: 14.0),
                              )),
                          AppTexts.title('Affiliation & Profile',
                              forceCaprasimo: true,
                              fontSize: 20,
                              color: AppColors.primary),
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomHtmlWidget(
                                content: controller.maxPercentagePoliticParty
                                        ?.party.profile?.affiliation ??
                                    "",
                                textStyle: AppTexts.customTextStyle(
                                    AppTextType.regular,
                                    color: AppColors.primary,
                                    fontSize: 14.0),
                              )),
                          AppTexts.title('Red Flags',
                              forceCaprasimo: true,
                              fontSize: 20,
                              color: AppColors.primary),
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CustomHtmlWidget(
                                content: controller.maxPercentagePoliticParty
                                        ?.party.profile?.redFlags
                                        ?.trim() ??
                                    "",
                                textStyle: AppTexts.customTextStyle(
                                    AppTextType.regular,
                                    color: AppColors.primary,
                                    fontSize: 14.0),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomHtmlWidget(
                                  content:
                                      """<a href="${controller.maxPercentagePoliticParty?.party.profile?.link1?.trim()}"> ${controller.maxPercentagePoliticParty?.party.profile?.link1Text?.trim()}</a>""",
                                  textStyle: AppTexts.customTextStyle(
                                      AppTextType.regular,
                                      color: AppColors.primary,
                                      fontSize: 14.0),
                                ),
                                CustomHtmlWidget(
                                  content:
                                      """<a href='${controller.maxPercentagePoliticParty?.party.profile?.link2?.trim()}'> ${controller.maxPercentagePoliticParty?.party.profile?.link2Text?.trim()}</a>""",
                                  textStyle: AppTexts.customTextStyle(
                                      AppTextType.regular,
                                      color: AppColors.primary,
                                      fontSize: 14.0),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
              ),
              CustomSpacer(multiplier: 12),
            ],
          ),
        )
      ]),
    );
  }
}
