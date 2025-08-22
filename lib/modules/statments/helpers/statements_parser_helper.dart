import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/statements_data.dart';

class StatementsParser {
  static List<CardModel> getCardModelList(List<Statement> statements) {
    return statements
        .map((statement) => CardModel(
              id: statement.id,
              emojis: statement.emojis,
              mainQuestion: statement.statement,
              details: statement.details,
              isOnboardingCard: statement.isTutorial,
              enableCardFlip: !statement.details.isEmpty,
            ))
        .toList();
  }
}
