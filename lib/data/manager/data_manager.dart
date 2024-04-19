import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';

class DataManager {
  static final DataManager _singleton = new DataManager._internal();

  DataManager._internal();

  factory DataManager() {
    return _singleton;
  }

  List<Language>? languages;
  List<Country>? countries;
  List<Statement>? statements;
  List<PoliticParty>? parties;

  void setLanguages(List<Language>? languages) {
    this.languages = languages;
  }

  List<Language> getLanguages() {
    return languages ?? [];
  }

  void setCountries(List<Country>? countries) {
    this.countries = countries;
  }

  List<Country> getCountries() {
    return countries ?? [];
  }

  void setStatements(List<Statement>? statements) {
    this.statements = statements;
  }

  List<Statement> getStatements() {
    return statements ?? [];
  }

  void setParties(List<PoliticParty>? parties) {
    this.parties = parties;
  }

  List<PoliticParty> getParties() {
    return parties ?? [];
  }
}
