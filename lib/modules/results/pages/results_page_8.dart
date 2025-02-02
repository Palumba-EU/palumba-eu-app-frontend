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
import 'package:palumba_eu/utils/utils.dart';

class ResultsPage8 extends GetView<ResultsController> with ResultsPage {
  @override
  final bool showSpecialBackground = true;

  @override
  Widget build(BuildContext context) {
    final maxTopic = controller.maxTopicPercentage();
    return Column(
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
              child: AppTexts.title(
                  maxTopic.isExtreme1
                      ? maxTopic.topicData.extreme1Emojis!
                      : maxTopic.topicData.extreme2Emojis!,
                  color: AppColors.primary,
                  fontSize: 32.5),
            )
          ],
        ),
        CustomSpacer(
          multiplier: 3,
        ),
        Padding(
          padding: AppDimens.lateralPadding,
          child: AppTexts.title(
            ElectionManager.currentElection.value.resultsPage8_1Text(
                context, maxTopic.topicData.name ?? '', maxTopic.percentage),
            color: AppColors.primary,
            textAlign: TextAlign.center,
          ),
        ),
        AppTexts.title(
            maxTopic.isExtreme1
                ? maxTopic.topicData.extreme1 ?? ''
                : maxTopic.topicData.extreme2 ?? '',
            color: Utils.getApiColor(maxTopic.topicData.color ?? '')),
        CustomSpacer(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.bigLateralPaddingValue),
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
    );
  }
}
