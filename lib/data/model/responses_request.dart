import 'package:palumba_eu/data/model/user_model.dart';

class ResponsesRequest {
  final List<Answer> answers;

  ResponsesRequest({required this.answers});

  // Convert AnswerModel instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
}
