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
import '../../../utils/utils.dart';

class ResultsPage2Bio extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    bool isTablet = controller.isTablet;
    return Container(
      color: ElectionManager.currentElection.value.background,
      child: Stack(children: [
        HeartStackNY(),
        SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(multiplier: 1),
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
                              fontSize: 22,
                              color: AppColors.primary),
                          Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: CustomHtmlWidget(
                                textAlign: TextAlign.center,
                                content: controller.maxPercentagePoliticParty
                                        ?.party.profile?.bio
                                        ?.trim() ??
                                    "",
                                textStyle: AppTexts.customTextStyle(
                                    AppTextType.regular,
                                    color: AppColors.primary,
                                    fontSize: 14.0),
                              )),
                          AppTexts.title(S.of(context).affiliationAndProfile,
                              forceCaprasimo: true,
                              fontSize: 22,
                              color: AppColors.primary),
                          Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: CustomHtmlWidget(
                                textAlign: TextAlign.center,
                                content: controller.maxPercentagePoliticParty
                                        ?.party.profile?.affiliation ??
                                    "",
                                textStyle: AppTexts.customTextStyle(
                                    AppTextType.regular,
                                    color: AppColors.primary,
                                    fontSize: 14.0),
                              )),
                          AppTexts.title(S.of(context).redFlags,
                              forceCaprasimo: true,
                              fontSize: 22,
                              color: AppColors.primary),
                          Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: CustomHtmlWidget(
                                textAlign: TextAlign.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Utils.launch(controller
                                            .maxPercentagePoliticParty
                                            ?.party
                                            .profile
                                            ?.link1 ??
                                        "");
                                  },
                                  child: AppTexts.small(
                                      controller.maxPercentagePoliticParty
                                              ?.party.profile?.link1Text ??
                                          "",
                                      color: AppColors.lightPrimary,
                                      bold: false,
                                      decoration: TextDecoration.underline),
                                ),
                                Padding(
                                    padding: EdgeInsetsGeometry.symmetric(
                                        horizontal: 8),
                                    child: AppTexts.small("·",
                                        color: AppColors.lightPrimary,
                                        bold: false)),
                                GestureDetector(
                                  onTap: () {
                                    Utils.launch(controller
                                            .maxPercentagePoliticParty
                                            ?.party
                                            .profile
                                            ?.link2 ??
                                        "");
                                  },
                                  child: AppTexts.small(
                                      controller.maxPercentagePoliticParty
                                              ?.party.profile?.link2Text ??
                                          "",
                                      color: AppColors.lightPrimary,
                                      bold: false,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
              ),
              CustomSpacer(multiplier: 13),
            ],
          ),
        )
      ]),
    );
  }
}
