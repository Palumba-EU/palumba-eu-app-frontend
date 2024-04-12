import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/components/custom_semicircle_chart/semicircle_base.dart';
import 'package:palumba_eu/modules/results/models/custom_chart_data.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

import 'arc_custom_painter.dart';

class CustomSemicircleChart extends StatelessWidget {
  const CustomSemicircleChart(
      {super.key,
      required this.arcDiameter,
      this.maxValue = 100.0,
      this.charts});
  final double arcDiameter;
  final double maxValue;
  final List<CustomChartData>? charts;
  @override
  Widget build(BuildContext context) {
    double initialFontSizeBig = AppDimens.fontSizeSmall * 1.5;
    double initialFontSizeSmall = AppDimens.fontSizeExtraSmall;

    List<CustomChartData> reversedCharts = (charts ?? []).reversed.toList();
    List<Widget> arcLines = [];
    for (int i = 0; i < (charts?.length ?? 0); i++)
      arcLines.add(ArcLine(
        arcDiameter: arcDiameter - i * (arcDiameter / 7) + arcDiameter * .066,
        lineWidth: arcDiameter * .04 - (i + 1) * 4.5,
        maxValue: maxValue,
        value: charts?[i].value ?? 0,
        text: charts?[i].party ?? '',
        percentage: charts?[i].percentage ?? '',
        index: i,
        imageUrl: charts?[i].image ?? '',
      ));
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimens.bigLateralPaddingValue),
          child: SizedBox(
            height: arcDiameter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SemicircleBase(
                  arcDiameter: arcDiameter,
                  color: AppColors.darkPurple,
                ),
                ...arcLines.reversed.toList(),
              ],
            ),
          ),
        ),
        Positioned(
          top: AppDimens.smallPaddingValue,
          bottom: AppDimens.smallPaddingValue,
          left: Get.width * .5,
          //right: 0,
          child: SizedBox(
            child: FittedBox(
              fit: Get.height < 750 ? BoxFit.scaleDown : BoxFit.contain,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < (charts?.length ?? 0); i++)
                    SizedBox(
                        width: Get.width * .3,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: (i == 0 || i == 1 || i == 2) ? 0 : 8,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: AppTexts.small(
                                charts![i].party,
                                fontSize: (i == 0 || i == 1 || i == 2)
                                    ? initialFontSizeBig
                                    : initialFontSizeSmall,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        )),
                  // Add smallest arc diameter as space
                  SizedBox(
                      height: arcDiameter -
                          7 * (arcDiameter / 7) +
                          arcDiameter * .15),
                  for (int i = 0; i < reversedCharts.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: (i == 4 || i == 5 || i == 6) ? 0 : 6,
                      ),
                      child: AppTexts.small(
                        reversedCharts[i].percentage,
                        fontSize: (i == 4 || i == 5 || i == 6)
                            ? initialFontSizeBig
                            : initialFontSizeSmall,
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
