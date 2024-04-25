import 'dart:convert';

enum StatementResponse {
  stronglyDisagree, // -1
  disagree, // -0.5
  neutral, // 0
  agree, // 0.5
  stronglyAgree, // 1
  skip
}

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  int? age;
  int? countryId;
  String? languageId;
  String? gender;
  List<Answer> answers;

  UserData({
    this.age,
    this.countryId,
    this.languageId,
    this.gender,
    required this.answers,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        age: json["age"],
        countryId: json["country_id"],
        languageId: json["language_id"],
        gender: json["gender"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "country_id": countryId,
        "language_id": languageId,
        "gender": gender,
        "answers": List<Map<String, dynamic>>.from(answers.map((x) {
          //Make sure to parse only the answers that are not skipped
          if (x.answer != StatementResponse.skip) {
            return x.toJson();
          }
          return null;
        }).where((x) => x != null))
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
        "answer": _statementResponseValues(answer),
      };
}

double _statementResponseValues(StatementResponse response) {
  switch (response) {
    case StatementResponse.stronglyDisagree:
      return -1;
    case StatementResponse.disagree:
      return -0.5;
    case StatementResponse.neutral:
      return 0;
    case StatementResponse.agree:
      return 0.5;
    case StatementResponse.stronglyAgree:
      return 1;
    default:
      return -2;
  }
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
      return StatementResponse.skip;
  }
}
