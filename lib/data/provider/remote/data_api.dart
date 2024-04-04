import 'dart:convert';

import 'package:palumba_eu/data/model/localization.dart';

import 'package:http/http.dart' as http;

class DataAPI {
  var baseUrl = 'https://palumba.bitperfect-software.com/api';
  var headers = {'Accept': 'application/json'};

  final localizationsEndpoint = '/localization';

  Future<Localization?> fetchLocalizations() async {
    try {
      final url = Uri.parse('${baseUrl}${localizationsEndpoint}');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      return Localization.fromJson(json.decode(response.body));
    } catch (e) {
      return null;
    }
  }
}
