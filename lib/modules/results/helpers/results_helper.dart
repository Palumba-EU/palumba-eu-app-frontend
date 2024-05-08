import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';

class PartyUserDistance {
  final PoliticParty party;
  final int percentage;
  final double? positionX;
  final double? positionY;

  PartyUserDistance(
      {required this.party,
      required this.percentage,
      this.positionX,
      this.positionY});

  factory PartyUserDistance.fromJson(Map<String, dynamic> json) {
    return PartyUserDistance(
      party: PoliticParty.fromJson(json['party']),
      percentage: json['percentage'],
      positionX: json['positionX'],
      positionY: json['positionY'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'party': party.toJson(),
      'percentage': percentage,
      'positionX': positionX,
      'positionY': positionY,
    };
  }
}

class ResultsHelper {
  //This function calculates the distance between two responses
  static int likertDistance(StatementResponse a, StatementResponse b) {
    List<StatementResponse> options = [
      StatementResponse.stronglyAgree,
      StatementResponse.agree,
      StatementResponse.neutral,
      StatementResponse.disagree,
      StatementResponse.stronglyDisagree
    ];
    int aIndex = options.indexOf(a);
    int bIndex = options.indexOf(b);

    List<List<int>> distanceMatrix = [
      [0, 2, 4, 6, 8],
      [2, 3, 4, 5, 6],
      [4, 4, 4, 4, 4],
      [6, 5, 4, 3, 2],
      [8, 6, 4, 2, 0]
    ];

    return distanceMatrix[aIndex][bIndex];
  }

  static double calculateTopicDimension(List<Answer> answers, int topicId) {
    double total = 0;

    for (var statement in DataManager().getStatements()) {
      var answerStatement = byStatementId(answers, statement.id!);

      if (answerStatement == null) {
        continue;
      }

      var answer = answerStatement.answer;

      var factor = {
        StatementResponse.stronglyDisagree: -1.0,
        StatementResponse.disagree: -0.5,
        StatementResponse.neutral: 0.0,
        StatementResponse.agree: 0.5,
        StatementResponse.stronglyAgree: 1.0
      }[answer]!;
      var dimensionWeight =
          byTopicId(statement.weights ?? [], topicId)?.weight ?? 0.0;
      total += factor * dimensionWeight;
    }

    return total;
  }

  static double maxMagnitudeForTopicsDimension(int topicId) {
    double total = 0;

    for (var statement in DataManager().getStatements()) {
      var dimensionWeight =
          byTopicId(statement.weights ?? [], topicId)?.weight ?? 0.0;
      total += dimensionWeight.abs();
    }

    return total;
  }

  static Answer? byStatementId(List<Answer> items, int statementId) {
    for (var item in items) {
      if (item.statementId == statementId) {
        return item;
      }
    }
    return null;
  }

  static Weight? byTopicId(List<Weight> items, int topicId) {
    for (var item in items) {
      if (item.topic_id == topicId) {
        return item;
      }
    }
    return null;
  }

  static double topicMatchPercentage(int topicId, List<Answer> userAnswers) {
    final maxMagnitude = maxMagnitudeForTopicsDimension(topicId);
    final userMagnitude = calculateTopicDimension(userAnswers, topicId);
    return userMagnitude / maxMagnitude;
  }
}

class CardStatementData {
  late Statement statement;
  late Answer answer;
  late List<PoliticParty> parties;

  CardStatementData(
      {required this.statement, required this.answer, required this.parties});
}

class NeedleData {
  final double fraction;
  final PoliticParty? topicMatch;

  NeedleData({required this.fraction, required this.topicMatch});
}

class MaxTopic {
  final String percentage;
  final bool isExtreme1;
  final Topic topicData;

  MaxTopic(
      {required this.percentage,
      required this.isExtreme1,
      required this.topicData});
}

class CompassData {
  final double positionX;
  final double positionY;

  CompassData({required this.positionX, required this.positionY});
}
