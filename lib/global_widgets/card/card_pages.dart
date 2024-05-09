import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class FirstCardPage extends StatelessWidget {
  const FirstCardPage(
    this.card,
    this.isOnboardingCard, {
    super.key,
  });

  final CardModel? card;
  final bool isOnboardingCard;

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
      ],
    );
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
