import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';

class PartyUserDistance {
  final PoliticParty party;
  final int percentage;

  PartyUserDistance({required this.party, required this.percentage});

  factory PartyUserDistance.fromJson(Map<String, dynamic> json) {
    return PartyUserDistance(
      party: PoliticParty.fromJson(json['party']),
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'party': party.toJson(),
      'percentage': percentage,
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
      [0, 1, 2, 3, 4],
      [1, 0, 1, 2, 3],
      [2, 1, 0, 1, 2],
      [3, 2, 1, 0, 1],
      [4, 3, 2, 1, 0]
    ];

    return distanceMatrix[aIndex][bIndex];
  }
}
