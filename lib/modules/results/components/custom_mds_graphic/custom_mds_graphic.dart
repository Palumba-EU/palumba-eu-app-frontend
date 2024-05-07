import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/graphic_axis.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/scatter_points.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class CustomMDSGraphic extends StatelessWidget {
  const CustomMDSGraphic(
      {super.key,
      required this.height,
      required this.width,
      this.pointColor,
      required this.scatterSpots});
  final double height;
  final double width;
  final Color? pointColor;
  final List<ScatterSpot> scatterSpots;

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.symmetric(
        horizontal: AppDimens.extraLargeLateralPaddingValue,
        vertical: AppDimens.bigLateralPaddingValue);
    return Padding(
      padding: const EdgeInsets.all(AppDimens.smallPaddingValue),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Padding(
              padding: padding,
              child: GraphicAxis(
                assetImage: 'palumba_badge_compass',
              ),
            ),
            //Top text
            _graphicTextIndicator(
                S.of(context).resultsPage4TitleTop, Alignment.topCenter, 0),
            //Left text
            _graphicTextIndicator(
                S.of(context).resultsPage4TitleLeft, Alignment.centerLeft, 3),
            //Right text
            _graphicTextIndicator(
                S.of(context).resultsPage4TitleRight, Alignment.centerRight, 1),
            //Bottom text
            _graphicTextIndicator(S.of(context).resultsPage4TitleBottom,
                Alignment.bottomCenter, 0),

            Center(
              child: Padding(
                  padding: const EdgeInsets.all(
                    AppDimens.extraLargeLateralPaddingValue,
                  ),
                  child: MyScatterChart(
                    scatterSpots: scatterSpots,
                  )),
            ),
          ],
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
