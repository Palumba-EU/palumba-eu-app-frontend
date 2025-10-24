import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/pages/results_shared/results_heart_stack.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

import '../../../global_widgets/custom_network_image.dart';
import '../../../utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPageRankingResultGraph extends GetView<ResultsController>
    with ResultsPage {
  final List<Candidate> candidates = [];
  final List<Color> colors = [
    const Color(0xFFFAC25E),
    const Color(0xFFB8A4CC),
    const Color(0xFF72BC8C),
  ];

  @override
  Widget build(BuildContext context) {
    final data = controller.chartData;
    candidates.clear();
    int maxPercentage = 0;
    for (var model in data) {
      final int percentage = int.parse(model.percentage.replaceAll("%", ""));
      if (percentage > maxPercentage) maxPercentage = percentage;
    }

    for (int i = 0; i < data.length; i++) {
      final model = data[i];
      final int percentage = int.parse(model.percentage.replaceAll("%", ""));
      bool isWinner = percentage == maxPercentage;

      Color barColor = isWinner
          ? const Color(0xFFFAC25E)
          : (i < colors.length ? colors[i] : Colors.grey);

      candidates.add(Candidate(
        percentage: percentage,
        name: model.party,
        color: barColor,
        imagePath: model.image,
      ));
    }

    candidates.sort((a, b) => b.percentage.compareTo(a.percentage));
    if (candidates.length > 2) {
      final winner = candidates.removeAt(0);
      final middleIndex = (candidates.length / 2).floor();
      candidates.insert(middleIndex, winner);
    }

    return SafeArea(
      child: Stack(
        children: [
          HeartStackNY(),
          Container(
            // color: ElectionManager.currentElection.value.background,
            // color: AppColors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              // spacing: 20,
              children: [
                // CustomSpacer(multiplier: 3),
                if (candidates.isNotEmpty)
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 38,
                        children: candidates.map((candidate) {
                          return CandidateBar(
                              percentage: candidate.percentage,
                              name: candidate.name.split(" ")[1],
                              color: candidate.color,
                              image: candidate.imagePath);
                        }).toList(),
                      ),
                    ),
                  ),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                      horizontal: AppDimens.bigLateralPaddingValue,
                      vertical: 10),
                  child: AppTexts.title(S.of(context).likeFootballFantasy,
                      color: AppColors.primary, textAlign: TextAlign.center),
                ),
                /*CustomSpacer(
                  multiplier: 2,
                )*/
                SizedBox(
                  height: controller.shareButtonHeight.value,
                )
              ],
            ),
          ),
        ],
      ),
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

class Candidate {
  final int percentage;
  final String name;
  final Color color;
  final String imagePath;

  Candidate(
      {required this.percentage,
      required this.name,
      required this.color,
      required this.imagePath});
}

class CandidateBar extends StatelessWidget {
  final int percentage;
  final String name;
  final Color color;
  final String image;

  const CandidateBar(
      {super.key,
      required this.percentage,
      required this.name,
      required this.color,
      required this.image});

  @override
  Widget build(BuildContext context) {
    double barHeight = Get.height * 0.42;
    double progressHeight = barHeight * (percentage / 100);
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTexts.title('$percentage%',
                    color: AppColors.primary,
                    fontSize: 20,
                    textAlign: TextAlign.center),
                const SizedBox(height: 4),
                CustomNetworkImage(
                  width: Get.width * .10,
                  height: Get.width * .10,
                  isSvg: true,
                  imageUrl: image,
                  radius: Get.width,
                  color: AppColors.blue,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: /*progressHeight*/ Get.height * 0.16,
                width: 48,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                height: progressHeight,
                width: 48,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Padding(
                  padding: AppDimens.lateralPadding,
                  child: AppTexts.title(
                    name,
                    color: AppColors.text,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
