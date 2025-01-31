import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';

class StatementsParser {
  static List<CardModel> getCardModelList(List<Statement> statements) {
    List<CardModel> cards = [];

    for (var statement in statements) {
      cards.add(CardModel(
        id: statement.id,
        emojis: statement.emojis,
        mainQuestion: statement.statement,
        details: statement.details,
        isOnboardingCard: statement.isTutorial,
        enableCardFlip: !statement.details.isEmpty,
      ));
    }

    return cards;
  }
}
