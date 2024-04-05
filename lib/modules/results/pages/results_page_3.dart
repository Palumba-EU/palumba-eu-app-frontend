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
    final List<ChartData> chartData = [
      ChartData(1922, 15, '100%', Colors.blue),
      ChartData(1925, 20, '100%', Colors.green),
      ChartData(1926, 30, '100%', Colors.red),
      ChartData(1922, 35, '100%', Colors.amber),
      ChartData(1925, 40, '100%', Colors.pink),
      ChartData(1926, 45, '100%', Colors.orange),
      ChartData(1922, 50, '100%', Colors.yellowAccent),
    ];

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
                Padding(
                  padding:
                      EdgeInsets.only(left: AppDimens.bigLateralPaddingValue),
                  child: CustomSemicircleChart(
                    arcDiameter: Get.height * .45,
                    charts: controller.chartData,
                  ),
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
