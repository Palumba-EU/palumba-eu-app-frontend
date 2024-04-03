import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class FirstCardPage extends StatelessWidget {
  const FirstCardPage(
    this.card,
    this.isOnboardingCard, {
    super.key,
  });
  final CardModel card;
  final bool isOnboardingCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DUI.spacing.spacer(multiplier: 3),
        if (!isOnboardingCard)
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: DUI.spacing.lateralPaddingValue,
                vertical: DUI.spacing.smallPaddingValue),
            decoration: BoxDecoration(
              color: AppColors.text.withOpacity(.5),
              borderRadius: BorderRadius.circular(DUI.spacing.borderRadius),
            ),
            child:
                DUI.text.regular(context, '️‍🕵️‍♀📣⚖️', color: AppColors.text),
          ),
        DUI.spacing.spacer(multiplier: 2),
        DUI.text.title1(context,
            isOnboardingCard ? S.of(context).onBoardingCardQuestion : card.main,
            color: AppColors.text),
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
            DUI.spacing.spacer(multiplier: 2),
            DUI.text.regular(context, '[whistleblowe]',
                color: AppColors.text, bold: true),
            DUI.text.regular(context, card.whistleblowe, color: AppColors.text),
            DUI.spacing.spacer(multiplier: 2),
            DUI.text.title3(context, 'Context', color: AppColors.text),
            DUI.spacing.spacer(multiplier: 2),
            DUI.text.regular(context, card.context, color: AppColors.text),
            DUI.spacing.spacer(multiplier: 8),
          ],
        ),
      ),
    );
  }
}

class ThirdCardPage extends StatelessWidget {
  const ThirdCardPage(
    this.card, {
    super.key,
  });
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DUI.spacing.spacer(multiplier: 2),
        DUI.text.title3(
          context,
          'Arguments in favor',
          color: AppColors.text,
        ),
        DUI.spacing.spacer(multiplier: 2),
        DUI.text.title3(context, card.favorArgs, color: AppColors.text),
      ],
    );
  }
}

class FourthCardPage extends StatelessWidget {
  const FourthCardPage(
    this.card, {
    super.key,
  });
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DUI.spacing.spacer(multiplier: 2),
        DUI.text.title3(
          context,
          'Arguments against',
          color: AppColors.text,
        ),
        DUI.spacing.spacer(multiplier: 2),
        DUI.text.title3(context, card.againstArgs, color: AppColors.text),
      ],
    );
  }
}
