import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/user_model.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/card_widget.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class ResultsPage9 extends GetView<ResultsController> {
  const ResultsPage9({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacer(
          multiplier: 3,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          //TODO
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
        CustomSpacer(
          multiplier: 3,
        ),
        Padding(
          padding: AppDimens.lateralPadding,
          child: Column(
            children: [
              AppTexts.small(S.of(context).resultsPage9Help,
                  color: AppColors.primary),
              CustomSpacer(),
              AppTexts.regular(S.of(context).resultsPage9Text1,
                  color: AppColors.primary,
                  textAlign: TextAlign.center,
                  fontSize: AppDimens.fontSizeTitle),
              AppTexts.title(S.of(context).resultsPage9Text2,
                  color: AppColors.primary, textAlign: TextAlign.center),
            ],
          ),
        ),
        CustomSpacer(
          multiplier: 12,
        )
      ],
    );
  }
}
