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

  static List<PartyUserDistance> getPartyUserDistances(List<Answer> userAnswers) {
    var parties = DataManager().getParties();
    List<PartyUserDistance> groupDistances = [];

    //Calculate distances percentage
    for (final PoliticParty party in parties) {
      final partyAnswers = party.answers ?? [];
      //Calculate max distance
      userAnswers
          .where((element) => element.answer != StatementResponse.skip)
          .toList();
      int numStatements = party.answers?.length ??
          0;
      List<Answer> maxDisagreeAnswers = List<Answer>.generate(
          numStatements,
              (index) => Answer(
              statementId: index, answer: StatementResponse.stronglyDisagree));
      List<Answer> maxAgreeAnswers = List<Answer>.generate(
          numStatements,
              (index) => Answer(
              statementId: index, answer: StatementResponse.stronglyAgree));
      int maxDistance = calculateDistance(maxAgreeAnswers, maxDisagreeAnswers);

      //Calculate distance between user and party
      final distance = calculateDistance(
        userAnswers,
        partyAnswers,
      );

      //Calculate percentage and add to List
      int percentage = 0;
      if (distance != -1) {
        percentage = ((1 - (distance / maxDistance)) * 100).round();
      }

      groupDistances
          .add(PartyUserDistance(party: party, percentage: percentage));
    }

    return groupDistances;
  }

  static int calculateDistance(List<Answer> userAnswers, List<Answer> epGroupAnswers) {
    int totalDistance = 0;
    int answersCount = 0;
    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] == StatementResponse.skip) {
        continue;
      }
      //Check if user statment is in the party answers
      if (!epGroupAnswers
          .any((answer) => answer.statementId == userAnswers[i].statementId)) {
        continue;
      }
      answersCount++;
      Answer matchingAnswer = epGroupAnswers.firstWhere(
            (answer) => answer.statementId == userAnswers[i].statementId,
      );
      int statementDistance = ResultsHelper.likertDistance(
        userAnswers[i].answer,
        matchingAnswer.answer,
      );
      totalDistance += statementDistance;
    }
    return answersCount == 0 ? -1 : totalDistance;
  }

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
      [0, 1, 2, 3, 4],
      [1, 0, 1, 2, 3],
      [2, 1, 0, 1, 2],
      [3, 2, 1, 0, 1],
      [4, 3, 2, 1, 0],
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
