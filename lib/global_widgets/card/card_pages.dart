import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
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
        CustomSpacer(multiplier: 3),
        if (!isOnboardingCard)
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.smallLateralPaddingValue,
                vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.beigeWithOpacity,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text('️‍🕵️‍♀📣⚖️',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        CustomSpacer(multiplier: 3),
        Text(
            isOnboardingCard ? S.of(context).onBoardingCardQuestion : card.main,
            style: Theme.of(context).textTheme.titleLarge),
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
            Text(
              '[whistleblowe]',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              card.whistleblowe,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CustomSpacer(multiplier: 2),
            Text(
              'Context',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CustomSpacer(multiplier: 2),
            Text(
              card.context,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CustomSpacer(multiplier: 8),
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
        CustomSpacer(multiplier: 2),
        Text(
          'Arguments in favor',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomSpacer(multiplier: 2),
        Text(
          card.favorArgs,
          style: Theme.of(context).textTheme.bodySmall,
        ),
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
        CustomSpacer(multiplier: 2),
        Text(
          'Arguments against',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomSpacer(multiplier: 2),
        Text(
          card.againstArgs,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
