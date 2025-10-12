import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';

class ResultsPage8 extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    final maxTopic = controller.maxTopicPercentage();
    print("--- MaxTopic Data ---");
    print("Percentage: ${maxTopic.percentage}");
    print("Is Extreme1: ${maxTopic.isExtreme1}");
    print("Topic ID: ${maxTopic.topicData.extreme1Details}");
    print("Topic ID: ${maxTopic.topicData.extreme2Details}");
    print("Topic Name: ${maxTopic.topicData.name}");
    print("Topic Image URL: ${maxTopic.topicData.icon}");
    print("--------------------");

    return Container(
      height: Get.height - 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/img_banner_top.svg',
                fit: BoxFit.fitWidth,
                width: Get.width,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: AppDimens.regularLateralPaddingValue),
                child: AppTexts.regular(
                    maxTopic.isExtreme1
                        ? maxTopic.topicData.extreme1Emojis!
                        : maxTopic.topicData.extreme2Emojis!,
                    color: AppColors.primary,
                    fontSize: 22),
              )
            ],
          ),
          CustomSpacer(
            multiplier: 6,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: AppTexts.title(
              ElectionManager.currentElection.value.resultsPage8_1Text(
                  context, maxTopic.topicData.name ?? '', maxTopic.percentage),
              color: AppColors.primary,
              textAlign: TextAlign.center,
            ),
          ),
          if (ElectionManager.currentElection.value == Election.NY)
            AppTexts.title(
                "${maxTopic.topicData.extreme1} & ${maxTopic.topicData.extreme2}",
                color: AppColors.lightPrimary,
                textAlign: TextAlign.center),
          CustomSpacer(
            multiplier: 0,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: AppDimens.largeLateralPaddingValue,
                right: AppDimens.largeLateralPaddingValue,
                bottom: AppDimens.largeLateralPaddingValue),
            child: CustomHtmlWidget(
              content: maxTopic.isExtreme1
                  ? maxTopic.topicData.extreme1Details ?? ''
                  : maxTopic.topicData.extreme2Details ?? '',
              textStyle: TextStyle(
                fontSize: AppDimens.fontSizeSmall,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
