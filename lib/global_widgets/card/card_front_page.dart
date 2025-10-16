import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class CardFrontPage extends StatelessWidget {
  const CardFrontPage(
    this.card,
    this.selectedResponseStatement, {
    super.key,
  });

  final CardModel card;
  final StatementResponse? selectedResponseStatement;

  @override
  Widget build(BuildContext context) {
    final text = card.mainQuestion;
    // debugPrint("isOnboardingCard " +
    //     card.id.toString() +
    //     card.isOnboardingCard.toString());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: Get.height * 0.05,
        ),
        emojiView(),
        SizedBox(
          height: Get.height * 0.02,
        ),
        RichText(
            text: TextSpan(
                style: AppTexts.customTextStyle(AppTextType.regular,
                    fontSize: 24, black: true),
                children: List.generate(
                    text.length,
                    (index) => TextSpan(
                        text: text[index],
                        style: TextStyle(
                            color: text[index] == '*'
                                ? AppColors.lightPrimary
                                : Colors.white))))),
        SizedBox(
          height: Get.height * 0.02,
        ),
        if (card.isOnboardingCard &&
            ElectionManager.currentElection.value != Election.NY)
          onBoardingView(context),
        if (ElectionManager.currentElection.value == Election.NY) Spacer(),
        if (ElectionManager.currentElection.value == Election.NY)
          Container(
            height: Get.height * 0.2,
            width: Get.width * 0.8,
            //color: AppColors.yellow,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_getOnboardingEmojis() != "") onBoardingViewNY(context),
                AppTexts.regular(
                    ElectionManager.currentElection.value == Election.NY
                        ? S.of(context).tapToTurnAndLearnMoreNY
                        : card.isOnboardingCard
                            ? S.of(context).statementsTutorialTurnInfo_ger25
                            : "",
                    fontSize: 12),
                CustomSpacer(
                  multiplier: 1,
                )
              ],
            ),
          ),
        //onBoardingView(context),
        CustomSpacer(small: true)
      ],
    );
  }

  Widget emojiView() {
    return EmojiLabelContainer(
      emoji: card.emojis,
      backgroundColor: AppColors.lightPrimary,
    );
  }

  Widget onBoardingView(BuildContext context) {
    return Center(
      child: Padding(
          padding:
              const EdgeInsets.only(top: AppDimens.largeLateralPaddingValue),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: _getBackgroundEmojiColor(),
                        spreadRadius: 0,
                        blurRadius: 48,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: _getBackgroundEmojiColor(),
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 22.5),
                child: Text(
                  _getOnboardingEmojis(),
                  style: TextStyle(fontSize: 32),
                ),
              ),
              CustomSpacer(
                multiplier: 2,
              ),
              AppTexts.regular(
                  card.isOnboardingCard
                      ? S.of(context).statementsTutorialTurnInfo_ger25
                      : "",
                  fontSize: 12),
              CustomSpacer(
                multiplier: 1,
              )
            ],
          )),
    );
  }

  Widget onBoardingViewNY(BuildContext context) {
    return Center(
      child: Padding(
          padding:
              const EdgeInsets.only(top: AppDimens.mediumLateralPaddingValue),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: _getBackgroundEmojiColor(),
                        spreadRadius: 0,
                        blurRadius: 48,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: _getBackgroundEmojiColor(),
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 22.5),
                child: Text(
                  _getOnboardingEmojis(),
                  style: TextStyle(fontSize: 32),
                ),
              ),
              CustomSpacer(
                multiplier: 2,
              ),
            ],
          )),
    );
  }

  String _getOnboardingEmojis() {
    switch (selectedResponseStatement) {
      case StatementResponse.stronglyDisagree:
        return '😤🙅‍';
      case StatementResponse.disagree:
        return '👎🏾';
      case StatementResponse.agree:
        return '👍';
      case StatementResponse.stronglyAgree:
        return '🧡⚡';
      case StatementResponse.neutral:
        return '🤷';
      case null:
        return '';
    }
  }

  Color _getBackgroundEmojiColor() {
    switch (selectedResponseStatement) {
      case StatementResponse.stronglyDisagree:
        return AppColors.yellow;
      case StatementResponse.disagree:
        return AppColors.lightYellow;
      case StatementResponse.agree:
        return AppColors.lightGreen;
      case StatementResponse.stronglyAgree:
        return AppColors.green;
      case StatementResponse.neutral:
        return AppColors.lightPrimary;
      case null:
        return Colors.transparent;
    }
  }
}
