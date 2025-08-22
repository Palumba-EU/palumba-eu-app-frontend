import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/graphic_axis.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/scatter_points.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';

class CustomMDSGraphic extends StatelessWidget {
  const CustomMDSGraphic(
      {super.key,
      required this.height,
      required this.width,
      required this.scatterSpots});
  final double height;
  final double width;
  final List<ScatterSpot> scatterSpots;

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.all(AppDimens.bigLateralPaddingValue);
    return Padding(
      padding: const EdgeInsets.all(AppDimens.smallPaddingValue),
      child: SizedBox(
        height: height,
        width: width,
        child: Obx(
          () => Stack(
            children: [
              Padding(
                padding: padding,
                child: GraphicAxis(
                  assetImage: 'palumba_badge_compass',
                ),
              ),
              //Top text
              _graphicTextIndicator(
                  ElectionManager.currentElection.value
                      .resultsPage4TitleTop(context),
                  Alignment.topCenter,
                  0),
              //Left text
              _graphicTextIndicator(
                  ElectionManager.currentElection.value
                      .resultsPage4TitleLeft(context),
                  Alignment.centerLeft,
                  3),
              //Right text
              _graphicTextIndicator(
                  ElectionManager.currentElection.value
                      .resultsPage4TitleRight(context),
                  Alignment.centerRight,
                  1),
              //Bottom text
              _graphicTextIndicator(
                  ElectionManager.currentElection.value
                      .resultsPage4TitleBottom(context),
                  Alignment.bottomCenter,
                  0),

              Center(
                child: Padding(
                    padding: const EdgeInsets.all(
                      AppDimens.lateralPaddingValue,
                    ),
                    child: MyScatterChart(
                      scatterSpots: scatterSpots,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _graphicTextIndicator(
    String text,
    Alignment alignment,
    int quarterTurns,
  ) {
    return Align(
        alignment: alignment,
        child: RotatedBox(
            quarterTurns: quarterTurns,
            child: AppTexts.regular(text,
                color: AppColors.lightPrimary, bold: true)));
  }
}

class GraphicDataModel {}
