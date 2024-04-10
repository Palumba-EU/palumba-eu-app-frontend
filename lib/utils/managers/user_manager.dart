import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';

class UserManager {
  static final UserManager _singleton = new UserManager._internal();

  UserManager._internal() {}

  factory UserManager() {
    return _singleton;
  }

  static UserData userData = UserData(answers: []);

  static setCountryId(int countryId) async {
    userData.countryId = countryId;
  }

  static setLanguageId(int langId) async {
    userData.languageId = langId;
  }

  static setGender(String? gender) async {
    userData.gender = gender;
  }

  static setAge(int? age) async {
    userData.age = age;
  }

  static addStatment(Statement statement, int answer) {
    userData.answers.add(Answer(statementId: statement.id!, answer: answer));
  }
}
