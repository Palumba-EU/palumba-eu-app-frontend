import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';

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

  static setCountryId(Country country) async {
    userCountry = country;
    userData.countryId = country.id;
  }

  static setLanguageId(String langId) async {
    userData.languageId = langId;
  }

  static setGender(gender? genderEnum) async {
    String? value;
    //TODO: add other gender values
    switch (genderEnum) {
      case gender.woman:
        value = 'female';
        break;
      case gender.man:
        value = 'male';
        break;
      default:
        break;
    }
    userData.gender = value;
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
