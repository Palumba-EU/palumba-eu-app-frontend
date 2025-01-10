import 'package:flutter/material.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class StatementsParser {
  static List<CardModel> getCardModelList(List<Statement> statements) {
    List<CardModel> cards = [];
    for (Statement statement in statements) {
      cards.add(CardModel(
        id: statement.id,
        emojis: statement.emojis,
        mainQuestion: statement.statement,
        details: statement.details,
        isOnboardingCard: true,
        enableCardFlip: true,
      ));
    }
    return cards;
  }

  static CardModel getIntroCard(BuildContext context, bool enableCardFlip) {
    // context later need for translated strings
    return CardModel(
        id: -1,
        emojis: "",
        mainQuestion: S.of(context).onBoardingCardQuestion,
        details: "OnboardingDetails",
        isOnboardingCard: true,
        enableCardFlip: enableCardFlip);
  }
}
