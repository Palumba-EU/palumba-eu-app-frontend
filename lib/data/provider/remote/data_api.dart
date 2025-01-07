import 'dart:convert';

import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/localization_data.dart';

import 'package:http/http.dart' as http;
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class DataAPI {
  var baseUrl = 'https://api.palumba-app.palumba.eu';

  var headers = {
    'Accept': 'application/json',
  };

  final localizationsEndpoint = '/localization';
  final statementsEndpoint = '/statements';
  final resultsEndpoint = '/results';
  final sponsorsEndpoint = '/sponsors';
  final responseEndpoint = '/responses';
  final statisticsEndpoint = '/statistics';

  Future<LocalizationData?> fetchLocalizations() async {
    try {
      final url = Uri.parse('${baseUrl}/'
          '${LanguageManager.currentLanguage}'
          '${localizationsEndpoint}?'
          'election=${ElectionManager.currentElection.value.backend}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var localization = LocalizationData.fromJson(json.decode(response.body));
      print(ElectionManager.currentElection.value);
      if (ElectionManager.currentElection.value == Election.DE) {
        print('use hardcoded languages');
        DataManager().setLanguages(json.decode(
            '{"languages":[{"id":1,"name":"English","language_code":"en"},{"id":9,"name":"Deutsch","language_code":"de"},{"id":16,"name":"Nederlands","language_code":"nl"},{"id":2,"name":"Rom\u00e2n\u0103","language_code":"ro"},{"id":4,"name":"Espa\u00f1ol","language_code":"es-ES"},{"id":3,"name":"Fran\u00e7ais","language_code":"fr"}]}'));
      } else {
        print('use real languages');
        DataManager().setLanguages(localization.languages);
      }
      DataManager().setCountries(localization.countries);
      return localization;
    } catch (e) {
      return null;
    }
  }

  Future<StatementsData?> fetchStatements() async {
    try {
      final url = Uri.parse(
          '${baseUrl}/${LanguageManager.currentLanguage}${statementsEndpoint}');
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
      final url = Uri.parse(
          '${baseUrl}/${LanguageManager.currentLanguage}${resultsEndpoint}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var results = ResultsData.fromJson(json.decode(response.body));
      DataManager().setParties(results.parties);
      DataManager().setTopics(results.topics);
      return results;
    } catch (e) {
      return null;
    }
  }

  Future<SponsorsData?> fetchSponsors() async {
    try {
      final url = Uri.parse(
          '${baseUrl}/${LanguageManager.currentLanguage}${sponsorsEndpoint}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var sponsors = SponsorsData.fromJson(json.decode(response.body));
      DataManager().setSponsors(sponsors.data);
      return sponsors;
    } catch (e) {
      return null;
    }
  }

  Future<int?> fetchStatistics() async {
    try {
      final url = Uri.parse('${baseUrl}${statisticsEndpoint}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var data = json.decode(response.body);
      return data['responses_last_24h'];
    } catch (e) {
      return null;
    }
  }

  Future<bool> setResponse() async {
    try {
      final url = Uri.parse('${baseUrl}${responseEndpoint}');
      var body = UserManager.userData.toJson();

      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(body));

      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
