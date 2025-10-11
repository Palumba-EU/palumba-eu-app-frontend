import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPageMemes extends GetView<ResultsController> with ResultsPage {
  @override
  final bool showMemesBackground = true;

  @override
  Widget build(BuildContext context) {
    bool isTablet = controller.isTablet;
    List<String> partyList = [];
    var other = controller.chartData;
    if (other.isNotEmpty) {
      other.forEach((action) {
        // action.party ?? "";
        print("OtherParty ${action.party}");
        if (controller.maxPercentagePoliticParty?.party.name !=
            action.party.toString()) {
          partyList.add(action.party.toString().split(" ").last);
        }
      });
    }

    return Container(
      child: Stack(children: [
        // HeartStack(),
        //MemesStack(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.bigLateralPaddingValue),
              child: controller.maxPercentagePoliticParty == null
                  ? AppTexts.title(S.of(context).resultsPage2NoResults,
                      color: AppColors.primary)
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSpacer(multiplier: 7),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(
                              'assets/images/election/ny/img_memes_main.png',
                              width: Get.width * (isTablet ? .45 : .58),
                              height: Get.width * (isTablet ? .45 : .58),
                            ),
                          ),
                          CustomSpacer(multiplier: 2),
                          AppTexts.title(
                              "*" + S.of(context).almostMatchedWrongCandidate,
                              textAlign: TextAlign.center,
                              fontSize: 22,
                              color: AppColors.primary),
                          CustomSpacer(multiplier: 2),
                          AppTexts.small(
                              "${S.of(context).basedOnYourSwipingInTheApp}: \n${controller.maxPercentagePoliticParty?.party.name.split(" ")[1]} >>> ${partyList.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", " &")}",
                              textAlign: TextAlign.center,
                              color: AppColors.primary,
                              fontSize: 14)
                        ],
                      ),
                    ),
            ),
            CustomSpacer(multiplier: 12),
          ],
        )
      ]),
    );
  }
}
