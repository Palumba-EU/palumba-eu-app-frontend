import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/components/topic_indicator_widget.dart';

import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPage5 extends GetView<ResultsController> {
  const ResultsPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacer(),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(
                multiplier: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.bigLateralPaddingValue),
                child: AppTexts.small(S.of(context).resultsPage5Title,
                    color: AppColors.primary,
                    black: true,
                    textAlign: TextAlign.center),
              ),
              CustomSpacer(
                multiplier: 3,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return TopicIndicatorWidget(
                        title: S.of(context).resultsPage5Topic1,
                        color: AppColors.green,
                        position: 25,
                        party1: controller.maxPercentagePoliticParty?.party,
                        party2: controller.maxPercentagePoliticParty?.party,
                      );
                    } else if (index == 1) {
                      return TopicIndicatorWidget(
                        title: S.of(context).resultsPage5Topic2,
                        color: AppColors.lightPrimary,
                        position: 25,
                        party1: controller.maxPercentagePoliticParty?.party,
                        party2: controller.maxPercentagePoliticParty?.party,
                      );
                    }
                    return TopicIndicatorWidget(
                      title: S.of(context).resultsPage5Topic3,
                      color: AppColors.blue,
                      position: 25,
                      party1: controller.maxPercentagePoliticParty?.party,
                      party2: controller.maxPercentagePoliticParty?.party,
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
                  itemCount: 3),
              CustomSpacer(
                multiplier: 12,
              )
            ],
          ),
        ))
      ],
    );
  }
}
