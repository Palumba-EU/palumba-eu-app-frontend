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
                            padding: const EdgeInsets.only(top: 15),
                            child: AppTexts.small(
                                "ℹ️ Zohran Kwame Mamdani · 🎂 October 18, 1991 (34 y.o.) · 🏠 Astoria, Queens · 💫 Libra Affiliation & Profile Democratic Party nominee, member of the Democratic Socialists of America. Served Queens’ 36th district in the NY State Assembly since 2021. Foreclosure prevention housing counselor before. Focus on affordability (rent freezes, city-owned groceries, raising wages), public safety reform, free transit, and taxing high incomes. Red Flags 🚩 “Should Zohran Mamdani get to live in a rent-stabilized unit?” - The Gothamist · 🚩 “Critics say Zohran Mamdani is antisemitic” - Politico @zohrankmamdani · zohranfornyc.com",
                                color: AppColors.primary,
                                textAlign: TextAlign.center,
                                bold: true)

                            /*RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: AppTexts.customTextStyle(
                                      AppTextType.title,
                                      black: true,
                                      color: AppColors.primary),
                                  children: [
                                    TextSpan(
                                      text: ElectionManager
                                          .currentElection.value
                                          .resultsPage2_1Title(context),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${controller.maxPercentagePoliticParty?.party.name ?? ''} ',
                                      style: TextStyle(
                                          color: controller.getPartyColor()),
                                    ),
                                    TextSpan(
                                      text: ElectionManager
                                          .currentElection.value
                                          .resultsPage2_2Title(context),
                                    ),
                                  ],
                                ))*/
                            ,
                          ),
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
