import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/components/card_widget.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class ResultsPage9 extends GetView<ResultsController> with ResultsPage {
  @override
  final bool showShare = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomSpacer(
            multiplier: 2,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: controller.cardsData.isEmpty
                ? const SizedBox.shrink()
                : AppinioSwiper(
                    controller: controller.swiperController,
                    cardCount: controller.cardsData.length,
                    backgroundCardCount: 1,
                    backgroundCardScale: 1.0,
                    isDisabled: true,
                    backgroundCardOffset: Offset.zero,
                    swipeOptions: SwipeOptions.only(left: true, right: true),
                    loop: true,
                    cardBuilder: (BuildContext context, int index) {
                      var card = controller.cardsData[index];
                      return GestureDetector(
                        onTapDown: (details) {
                          if (card.answer.answer ==
                              StatementResponse.stronglyDisagree) {
                            controller.swiperController.swipeLeft();
                          } else {
                            controller.swiperController.swipeRight();
                          }
                        },
                        child: Transform.rotate(
                          angle: index % 2 == 0 ? 0.03 : -0.03,
                          child: CardWidget(
                            data: card,
                          ),
                        ),
                      );
                    },
                  ),
          )),
          CustomSpacer(),
          Padding(
            padding: AppDimens.lateralPadding,
            child: Column(
              children: [
                Obx(() => Opacity(
                    opacity: controller.loadingShare ? 0 : 1,
                    child: AppTexts.small(
                        ElectionManager.currentElection.value
                            .resultsPage9Help(context),
                        color: AppColors.primary))),
                CustomSpacer(),
                AutoSizeText(
                  ElectionManager.currentElection.value
                      .resultsPage9Text1(context),
                  maxLines: 2,
                  style: AppTexts.customTextStyle(
                    AppTextType.regular,
                    fontSize: 20,
                    bold: true,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppTexts.title(
                    ElectionManager.currentElection.value
                        .resultsPage9Text2(context),
                    color: AppColors.primary,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          CustomSpacer(
            multiplier: 11,
          )
        ],
      ),
    );
  }
}
