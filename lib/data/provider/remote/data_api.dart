import 'dart:convert';

import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';

import 'package:http/http.dart' as http;
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class DataAPI {
  var baseUrl = 'https://api.palumba-app.palumba.eu';

  var headers = {
    //'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Accept-Language': LanguageManager.currentLanguage,
  };

  final localizationsEndpoint = '/localization';
  final statementsEndpoint = '/statements';
  final resultsEndpoint = '/results';
  final responseEndpoint = '/responses';

  final langCode = '';//'/api/${LanguageManager.currentLanguage}';

  Future<LocalizationData?> fetchLocalizations() async {
    try {
      final url = Uri.parse('${baseUrl}${localizationsEndpoint}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var localization = LocalizationData.fromJson(json.decode(response.body));
      DataManager().setLanguages(localization.languages);
      DataManager().setCountries(localization.countries);
      return localization;
    } catch (e) {
      return null;
    }
  }

  Future<StatementsData?> fetchStatements() async {
    try {
      final url = Uri.parse('${baseUrl}${statementsEndpoint}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var statements = StatementsData.fromJson(json.decode(response.body));
      DataManager().setStatements(statements.data);
      return statements;
    } catch (e) {
      return null;
    }
  }

  Future<ResultsData?> fetchResultsInfo() async {
    try {
      final url = Uri.parse('${baseUrl}${langCode}${resultsEndpoint}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var results = ResultsData.fromJson(json.decode(response.body));
      DataManager().setParties(results.parties);
      return results;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setResponse() async {
    try {
      final url = Uri.parse('${baseUrl}${responseEndpoint}');
      var body = UserManager.userData.toJson();

      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
