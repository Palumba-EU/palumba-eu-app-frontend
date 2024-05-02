import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/custom_semicircle_chart/custom_hemicycle_chart.dart';
import '../results_controller.dart';

class ResultsPage3 extends GetView<ResultsController> {
  const ResultsPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        children: [
          CustomSpacer(multiplier: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * .5,
                child: Padding(
                  padding: AppDimens.lateralPadding,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.chartData.length,
                      itemBuilder: (context, index) {
                        final data = controller.chartData[index];
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.medium(data.percentage,
                                  color: AppColors.primary),
                              AppTexts.medium(data.party,
                                  color: AppColors.primary, bold: true),
                              CustomSpacer(),
                            ]);
                      }),
                ),
              ),
              Obx(
                () => controller.currentPage != 2
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: Get.width * .5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 18,
                              top: AppDimens.smallLateralPaddingValue),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomHemicycleChart(
                              arcDiameter: Get.width * .85,
                              charts: controller.chartData,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height < 750 ? 180 : 150,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                        'assets/images/img_miniature_hemicycle.png')),
                Positioned(
                  left: AppDimens.lateralPaddingValue,
                  right: AppDimens.lateralPaddingValue,
                  bottom: 0,
                  child: AppTexts.title(S.of(context).resultsPage3Title,
                      color: AppColors.primary),
                ),
              ],
            ),
          ),
          CustomSpacer(
            multiplier: 12,
          ),
        ],
      ),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text, this.color);

  final double x;
  final double y;
  final String text;
  final Color color;
}
