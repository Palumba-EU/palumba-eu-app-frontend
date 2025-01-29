import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';

class StatementsParser {
  static List<CardModel> getCardModelList(List<Statement> statements) {
    List<CardModel> cards = [];

    for (var (index, statement) in statements.indexed) {
      cards.add(CardModel(
        id: statement.id,
        emojis: statement.emojis,
        mainQuestion: statement.statement,
        details: statement.details,
        isOnboardingCard: index == 0, // first card is always onboarding
        enableCardFlip: true,
      ));
    }
    // TODO: isOnboardingCard should be a flag in a statement coming from the BE

    return cards;
  }
}
