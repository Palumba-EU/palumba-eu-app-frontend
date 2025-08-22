import 'dart:convert';

import 'package:get/get.dart';
import 'package:palumba_eu/data/model/responses_response.dart';
import 'package:palumba_eu/data/provider/local/local_data_api.dart';

class LocalDataRepository {
  LocalDataAPI _localApi = Get.find<LocalDataAPI>();

  set onBoarded(value) => _localApi.onBoarded(value);
  Future<bool?> get onBoarded => _localApi.getOnBoarded;

  set language(value) => _localApi.setLanguage(value);
  Future<String?> get language => _localApi.getLanguage;

  set country(value) => _localApi.setCountry(value);
  Future<String?> get country => _localApi.getCountry;

  set answers(value) => _localApi.setAnswers(value);
  Future<String?> get answers => _localApi.getAnswers;

  set results(value) => _localApi.setResults(value);
  Future<String?> get results => _localApi.getResults;

  set seenEggScreen(value) => _localApi.setSeenEYCA(value);
  Future<bool?> get seenEggScreen => _localApi.getSeenEYCA;

  set currentResponseData(value) => _localApi.setCurrentResponseData(value);
  Future<String?> get currentResponseData => _localApi.getCurrentResponseData;
  Future<String?> getCurrentResponseUuid() async {
    final currentResponseData = await _localApi.getCurrentResponseData;
    if (currentResponseData != null) {
      final response =
          ResponsesResponse.fromJson(json.decode(currentResponseData));
      return response.id;
    }
    return null;
  }
}
