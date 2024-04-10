
import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    int? age;
    int? countryId;
    int? languageId;
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
        answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "country_id": countryId,
        "language_id": languageId,
        "gender": gender,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
    };
}

class Answer {
    int statementId;
    int answer;

    Answer({
        required this.statementId,
        required this.answer,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        statementId: json["statement_id"],
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "statement_id": statementId,
        "answer": answer,
    };
}