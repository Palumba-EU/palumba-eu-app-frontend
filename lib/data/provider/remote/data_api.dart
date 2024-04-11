import 'dart:convert';

import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';

import 'package:http/http.dart' as http;
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';

class DataAPI {
  var baseUrlOld = 'https://palumba.bitperfect-software.com/api';
  var baseUrl = 'https://api.palumba-app.palumba.eu';

  var headers = {'Accept': 'application/json'};

  final localizationsEndpoint = '/localization';
  final statementsEndpoint = '/statements';
  final resultsEndpoint = '/results';
  final responseEndpoint = '/responses';

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
      final url = Uri.parse('${baseUrl}${resultsEndpoint}');
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

  //TODO: Implement
  Future<bool> setResponse(UserData userData) async {
    try {
      final url = Uri.parse('${baseUrl}${responseEndpoint}');
      var body = userData.toJson();
      /*{
        "age": "<integer>",
        "country": "<string>",
        "language": "<string>",
        "gender": "<string>",
        "answers": [
          {"statement_id": "<number>", "answer": "<number>"},
          {"statement_id": "<number>", "answer": "<number>"}
        ]
      };*/

      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}

//{"message":"The age field must be present. (and 4 more errors)","errors":{"age":["The age field must be present."],"country_id":["The country id field is required."],"language_id":["The language id field is required."],"gender":["The gender field must be present."],"answers":["The answers field must be present."]}}
