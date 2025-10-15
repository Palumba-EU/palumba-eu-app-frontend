import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';

import '../../../global_widgets/custom_network_image.dart';
import '../../../utils/common_ui/app_colors.dart';
import '../../../utils/common_ui/app_texts.dart';
import '../../../utils/managers/i18n_manager/translations/generated/l10n.dart';

class ResultsPageMoodBoard extends GetView<ResultsController> with ResultsPage {
  @override
  final bool showMemesBackground = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height * 1,
        child: Column(
          children: [
            // CustomSpacer(multiplier: 6),
            SizedBox(height: (Get.width * .28) / 2),
            _buildMainCard(context),
            Spacer(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: AppTexts.title(
                    S.of(context).yourNYCPoliticalMoodboardSummary,
                    color: AppColors.primary,
                    fontSize: 22,
                    textAlign: TextAlign.center)),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows children to overflow
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            color: const Color(0xFFFDFDF7), // Light cream color
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.all(color: AppColors.yellowBorder, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              /*CustomSpacer(
                multiplier: 5,
              ),*/
              SizedBox(height: (Get.width * .28) / 3),
              AppTexts.title(
                  controller.maxPercentagePoliticParty?.party.name ?? "",
                  color: AppColors.primary,
                  fontSize: 24,
                  textAlign: TextAlign.center),
              AppTexts.small("🥇${S.of(context).yourNewMayor}",
                  color: AppColors.primary,
                  textAlign: TextAlign.center,
                  fontSize: 14),
              const SizedBox(height: 20),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTexts.customTextStyle(AppTextType.small,
                        black: true, color: AppColors.primary),
                    children: [
                      TextSpan(
                          text: S.of(context).youAre,
                          style: AppTexts.customTextStyle(AppTextType.small,
                              bold: false, color: AppColors.primary)),
                      TextSpan(
                        text:
                            ' ${controller.maxPercentagePoliticParty?.percentage ?? ''}% ${S.of(context).compatible} ',
                        style: AppTexts.customTextStyle(AppTextType.small,
                            color: AppColors.primary, bold: true),
                      ),
                      TextSpan(
                          text: "${S.of(context).withPalumbaTest}",
                          style: AppTexts.customTextStyle(AppTextType.small,
                              bold: false, color: AppColors.primary)),
                    ],
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 10,
                children: [
                  Image.asset(
                    'assets/images/election/ny/img_ranking_1.png',
                    height: 40,
                    width: 40,
                  ),
                  SvgPicture.asset(
                    'assets/images/election/ny/ic_ranking_2.svg',
                    height: 50,
                    width: 45,
                  ),
                  Image.asset(
                    'assets/images/election/ny/img_ranking_3.png',
                    height: 50,
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildRankingSection(context),
              const SizedBox(height: 20),
              if (controller.topics.isNotEmpty) _buildTopicsSection(context),
              const SizedBox(height: 10)
            ],
          ),
        ),
        Positioned(
          top: -((Get.width * .28) / 2),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFDFDF7), // Light cream color
                borderRadius: BorderRadius.circular(Get.width),
                border: BoxBorder.all(color: AppColors.background, width: 2),
              ),
              child: CustomNetworkImage(
                width: Get.width * .28,
                height: Get.width * .28,
                isSvg: true,
                imageUrl:
                    controller.maxPercentagePoliticParty?.party.logo ?? "",
                radius: Get.width,
                color: AppColors.blue,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRankingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTexts.small(S.of(context).rankingOthers,
            color: AppColors.primary, textAlign: TextAlign.center),
        SizedBox(height: 5),
        if (controller.chartData.length > 1)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: controller.chartData.length,
            itemBuilder: (BuildContext context, int index) {
              var icon = index == 1 ? "🥈" : "🥉";
              return index != 0
                  ? _buildRankingItem(
                      context,
                      '$icon ${controller.chartData[index].party}',
                      int.parse(controller.chartData[index].percentage
                          .replaceAll("%", "")
                          .toString()))
                  : SizedBox();
            },
          ),
      ],
    );
  }

  Widget _buildRankingItem(
    BuildContext context,
    String name,
    int match,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTexts.small("$name, $match% ${S.of(context).match}",
              color: AppColors.primary,
              textAlign: TextAlign.center,
              bold: true),
        ],
      ),
    );
  }

  Widget _buildTopicsSection(BuildContext context) {
    print(
        "topicList => ${controller.maxPercentagePoliticParty?.party.positions?.length}");

    if (controller.maxPercentagePoliticParty?.party.positions?.isNotEmpty ==
        true) {
      final positionMap = {
        for (var pos
            in controller.maxPercentagePoliticParty?.party.positions ?? [])
          pos.topicId: pos.position
      };

      controller.topics.sort((a, b) {
        final posA = positionMap[a.id] ?? double.infinity;
        final posB = positionMap[b.id] ?? double.infinity;
        return posA.compareTo(posB);
      });

      for (var t in controller.topics) {
        print("${t.id} - ${t.name}");
      }
    }
    // Sort topics list
    // Print result
    const int maxItemsToShow = 3;
    final int itemsToBuild = (controller.top3Topics.length < maxItemsToShow)
        ? controller.top3Topics.length
        : maxItemsToShow;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTexts.small(S.of(context).yourTopTopics,
            color: AppColors.primary, textAlign: TextAlign.center),
        SizedBox(height: 5),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: itemsToBuild,
          itemBuilder: (BuildContext context, int index) {
            return _buildTopicItem(
                '#${index + 1} ${controller.top3Topics[index]}');
          },
        ),
        /* _buildTopicItem('Strong police & safe streets 👮‍♂️🚓🗽'),
        _buildTopicItem('Climate action 🌍🌳♻️'),
        _buildTopicItem('Housing regulation 🏠🏘️'),*/
      ],
    );
  }

  Widget _buildTopicItem(String topic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTexts.small("$topic",
              color: AppColors.primary, textAlign: TextAlign.center, bold: true)
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
