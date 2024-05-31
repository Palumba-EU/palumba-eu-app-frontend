import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class FirstCardPage extends StatelessWidget {
  const FirstCardPage(
    this.card,
    this.isOnboardingCard, {
    this.onBoardingButtonSelected,
    super.key,
  });

  final CardModel? card;
  final bool isOnboardingCard;
  final StatementResponse? onBoardingButtonSelected;

  @override
  Widget build(BuildContext context) {
    var text = (isOnboardingCard && card == null)
        ? S.of(context).onBoardingCardQuestion
        : card!.mainQuestion;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpacer(multiplier: 6),
        if (!isOnboardingCard && card != null)
          EmojiLabelContainer(
            emoji: card!.emojis,
            backgroundColor: AppColors.lightPrimary,
          ),
        CustomSpacer(
          multiplier: 2,
        ),
        CustomSpacer(small: true),
        RichText(
            text: TextSpan(
                style: AppTexts.customTextStyle(AppTextType.regular,
                    fontSize: 24, black: true),
                children: List.generate(text.length, (index) {
                  return TextSpan(
                      text: text[index],
                      style: TextStyle(
                          color: text[index] == '*'
                              ? AppColors.lightPrimary
                              : Colors.white));
                }))),
        (isOnboardingCard && onBoardingButtonSelected != null)
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: AppDimens.largeLateralPaddingValue),
                  child: Container(
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
                    padding:
                        EdgeInsets.symmetric(vertical: 12.5, horizontal: 22.5),
                    child: Text(
                      _getOnboardingEmojis(),
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  String _getOnboardingEmojis() {
    switch (onBoardingButtonSelected) {
      case StatementResponse.stronglyDisagree:
        return '😤🙅‍';
      case StatementResponse.disagree:
        return '👎🏾';
      case StatementResponse.agree:
        return '👍';
      case StatementResponse.stronglyAgree:
        return '🧡⚡';
      default:
        return '';
    }
  }

  Color _getBackgroundEmojiColor() {
    switch (onBoardingButtonSelected) {
      case StatementResponse.stronglyDisagree:
        return AppColors.yellow;
      case StatementResponse.disagree:
        return AppColors.lightYellow;
      case StatementResponse.agree:
        return AppColors.lightGreen;
      case StatementResponse.stronglyAgree:
        return AppColors.green;
      default:
        return AppColors.green;
    }
  }
}

class SecondCardPage extends StatelessWidget {
  const SecondCardPage(
    this.card, {
    super.key,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSpacer(multiplier: 2),
            CustomHtmlWidget(
              content: card.details,
              textStyle:
                  AppTexts.customTextStyle(AppTextType.regular, fontSize: 14.0),
            ),
            CustomSpacer(multiplier: 8),
          ],
        ),
      ),
    );
  }
}
