import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palumba_eu/modules/results/components/custom_semicircle_chart/hemicycle_base.dart';
import 'package:palumba_eu/modules/results/models/custom_chart_data.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'arc_custom_painter.dart';

class CustomHemicycleChart extends StatelessWidget {
  const CustomHemicycleChart(
      {super.key,
      required this.arcDiameter,
      this.maxValue = 100.0,
      this.charts});
  final double arcDiameter;
  final double maxValue;
  final List<CustomChartData>? charts;
  double _customArcSizes(int index) {
    final size = arcDiameter * .03;
    switch (index) {
      case 0:
        return size;
      case 1:
        return size - 4;
      case 2:
        return size - 6;

      default:
        return size - 7;
    }
  }

  @override
  Widget build(BuildContext context) {
    (charts ?? []).reversed.toList();
    List<Widget> arcLines = [];
    for (int i = 0; i < (charts?.length ?? 0); i++)
      arcLines.add(Positioned(
        top: 0,
        bottom: 0,
        child: ArcLine(
          arcDiameter: arcDiameter - i * (arcDiameter / 7) + arcDiameter * .066,
          lineWidth: _customArcSizes(i),
          maxValue: maxValue,
          value: charts?[i].value ?? 0,
          text: charts?[i].party ?? '',
          percentage: charts?[i].percentage ?? '',
          index: i,
          imageUrl: charts?[i].image ?? '',
        ),
      ));
    return Container(
      height: arcDiameter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Add base
          HemicycleBase(
            arcDiameter: arcDiameter,
            color: AppColors.lightPrimary,
          ),
          //Add parties arcs
          ...arcLines.reversed.toList(),
        ],
      ),
    );
  }
}
