import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

import '../components/custom_semicircle_chart/custom_semicircle_chart.dart';
import '../results_controller.dart';

class ResultsPage3 extends GetView<ResultsController> {
  const ResultsPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppDimens.lateralPaddingValue),
            child: Column(
              children: [
                AppTexts.title(S.of(context).resultsPage3Title),
                if (Get.height > 700)
                  CustomSpacer(
                    multiplier: 5,
                  ),
                CustomSemicircleChart(
                  arcDiameter: Get.width * .85,
                  charts: controller.chartData,
                ),
                CustomSpacer(
                  multiplier: 12,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CustomNetworkImage(
            height: Get.width * .3,
            width: Get.width,
            imageUrl: 'https://picsum.photos/seed/picsum/800/200',
            placeholder: 'assets/images/image_placeholder.svg',
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text, this.color);
  final double x;
  final double y;
  final String text;
  final Color color;
}
