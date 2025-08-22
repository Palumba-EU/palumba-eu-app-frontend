import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/components/topic_indicator_widget.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/utils.dart';

class ResultsPage5 extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        CustomSpacer(
          multiplier: 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.bigLateralPaddingValue),
          child: AppTexts.small(
              ElectionManager.currentElection.value.resultsPage5Title(context),
              color: AppColors.primary,
              bold: true,
              textAlign: TextAlign.center),
        ),
        CustomSpacer(
          multiplier: 2,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final topic = controller.topics[index];
              final needleData = controller.needlePositionsForTopic(topic.id!);
              return TopicIndicatorWidget(
                title: topic.name ?? '',
                color: Utils.getApiColor(topic.color!),
                position: needleData.fraction,
                party1: controller.maxPercentagePoliticParty?.party,
                party2: needleData.topicMatch,
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 1,
                width: double.infinity,
                color: AppColors.yellow,
              );
            },
            itemCount: controller.topics.length),
      ],
    ));
  }
}
