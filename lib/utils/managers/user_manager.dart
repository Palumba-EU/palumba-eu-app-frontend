import 'package:palumba_eu/data/model/gender_model.dart';
import 'package:palumba_eu/data/model/levelOfStudy_model.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
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

  static setTestRuning(bool value) {
    isTestRunning = value;
  }

  static setCountry(Country country) async {
    userCountry = country;
    userData.countryId = country.id;
  }

  static setLanguageCode(String langCode) async {
    userData.languageCode = langCode;
  }

  static setGender(Gender? genderEnum) async {
    String? value;
    switch (genderEnum) {
      case Gender.woman:
        value = 'female';
        break;
      case Gender.man:
        value = 'male';
        break;
      default:
        value = 'diverse';
        break;
    }
    userData.gender = value;
  }

  static setLevelOfEducation(LevelOfEducation? levelOfStudy) async {
    userData.gender = levelOfStudy.toString(); // TODO: extend enum for BE
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
