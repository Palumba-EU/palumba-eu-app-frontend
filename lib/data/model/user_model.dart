import 'dart:convert';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  int? age;
  int? countryId;
  String? languageCode;
  String? gender;
  String? levelOfEducation;
  List<Answer> answers;

  UserData({
    this.age,
    this.countryId,
    this.languageCode,
    this.gender,
    this.levelOfEducation,
    required this.answers,
  });

  Map<String, dynamic> toJson() => {
        "election_id": ElectionManager.currentElection.value.backend,
        "age": age,
        "country_id": countryId,
        "language_code": languageCode,
        "gender": gender,
        "level_of_education": levelOfEducation,
        "answers": [] // TODO: remove when api allows this to be null
      };
}

class Answer {
  int statementId;
  StatementResponse answer;

  Answer({
    required this.statementId,
    required this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        statementId: json["statement_id"],
        answer: _valuesToStatementResponse(json["answer"]),
      );

  Map<String, dynamic> toJson() => {
        "statement_id": statementId,
        "answer": answer.backend,
      };
}

StatementResponse _valuesToStatementResponse(num value) {
  switch (value) {
    case -1:
      return StatementResponse.stronglyDisagree;
    case -0.5:
      return StatementResponse.disagree;
    case 0:
      return StatementResponse.neutral;
    case 0.5:
      return StatementResponse.agree;
    case 1:
      return StatementResponse.stronglyAgree;
    default:
      return StatementResponse.neutral;
  }
}
