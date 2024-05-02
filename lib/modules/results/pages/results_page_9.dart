import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/card_widget.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class ResultsPage9 extends GetView<ResultsController> {
  const ResultsPage9({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Hide screen when any strong answer

    var swiperController = AppinioSwiperController();

    var answers = UserManager.userData.answers
        .where((element) =>
            element.answer == StatementResponse.stronglyAgree ||
            element.answer == StatementResponse.stronglyDisagree)
        .toList();

    return Column(
      children: [
        CustomSpacer(
          multiplier: 3,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: AppinioSwiper(
            controller: swiperController,
            cardCount: answers.length,
            backgroundCardCount: 1,
            backgroundCardScale: 1.0,
            isDisabled: true,
            backgroundCardOffset: Offset.zero,
            swipeOptions: SwipeOptions.only(left: true, right: true),
            loop: true,
            cardBuilder: (BuildContext context, int index) {
              var answer = answers[index];

              var statement = DataManager()
                  .statements!
                  .firstWhere((element) => element.id == answer.statementId);

              //TODO: Get parties for each answer
              var parties = [
                controller.maxPercentagePoliticParty?.party,
                controller.maxPercentagePoliticParty?.party,
              ];

              return GestureDetector(
                onTapDown: (details) {
                  swiperController.swipeRight();
                },
                child: Transform.rotate(
                  angle: index % 2 == 0 ? 0.03 : -0.03,
                  child: CardWidget(
                    statement: statement,
                    parties: parties,
                    color: index % 2 == 0 ? AppColors.green : AppColors.yellow,
                    colorBorder: index % 2 == 0
                        ? AppColors.lightGreen
                        : AppColors.lightYellow,
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
