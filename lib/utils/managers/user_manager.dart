import 'package:palumba_eu/data/model/gender_model.dart';
import 'package:palumba_eu/data/model/levelOfStudy_model.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/data/model/user_model.dart';

class UserManager {
  static final UserManager _singleton = new UserManager._internal();

  UserManager._internal() {}

  factory UserManager() {
    return _singleton;
  }

  static UserData userData = UserData(answers: []);
  static Country? userCountry;
  static bool isTestRunning = false;

  static setCountry(Country country) async {
    userCountry = country;
    userData.countryId = country.id;
  }

  static setLanguageCode(String langCode) async {
    userData.languageCode = langCode;
  }

  static setGender(Gender? gender) async {
    userData.gender = gender?.backend;
  }

  static setLevelOfEducation(LevelOfEducation? levelOfStudy) async {
    userData.levelOfEducation = levelOfStudy?.backend;
  }

  static setAge(int? age) async {
    userData.age = age;
  }

  static clearAllStatements() => userData.answers.clear();

  static addStatment(int statmentId, StatementResponse answer) {
    userData.answers.add(Answer(statementId: statmentId, answer: answer));
  }

  static deleteLastStatement() {
    userData.answers.removeLast();
  }
}
