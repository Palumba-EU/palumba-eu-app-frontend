import 'package:palumba_eu/data/model/goingToVote_model.dart';

class ResponsesPatchRequest {
  final GoingToVote goingToVote;

  ResponsesPatchRequest({required this.goingToVote});

  Map<String, dynamic> toJson() {
    return {
      'going_to_vote': goingToVote.backend,
    };
  }
}
