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
  // var baseUrl = 'https://api.palumba-app.palumba.eu';
  var baseUrl = 'https://palumba-staging.bitperfect-software.com/api';

  var headers = {
    'Accept': 'application/json',
  };

  String urlLang() {
    return baseUrl + '/${LanguageManager.currentLanguage}/';
  }

  String urlLangAndEl() {
    return urlLang() +
        'elections/${ElectionManager.currentElection.value.backend}/';
  }

  Future<LocalizationData?> fetchLocalizations() async {
    try {
      final url = Uri.parse('${urlLangAndEl()}' 'localization');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var localization = LocalizationData.fromJson(json.decode(response.body));
      DataManager().setLanguages(localization.languages ?? []);
      DataManager().setCountries(localization.countries);
      return localization;
    } catch (e) {
      return null;
    }
  }

  Future<StatementsData?> fetchStatements() async {
    try {
      final url = Uri.parse('${urlLangAndEl()}' 'statements');
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
      final url = Uri.parse('${urlLangAndEl()}' 'results');
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
      final url = Uri.parse('${urlLangAndEl()}' 'sponsors');
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
      final url = Uri.parse('${baseUrl}/statistics');
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
      final url = Uri.parse('${baseUrl}/responses');
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
