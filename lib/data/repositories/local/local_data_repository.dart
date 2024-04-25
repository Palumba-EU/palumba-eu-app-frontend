import 'package:get/get.dart';
import 'package:palumba_eu/data/provider/local/local_data_api.dart';

class LocalDataRepository {
  LocalDataAPI _localApi = Get.find<LocalDataAPI>();

  set onBoarded(value) => _localApi.onBoarded(value);
  Future<bool?> get onBoarded => _localApi.getOnBoarded;

  set language(value) => _localApi.setLanguage(value);
  Future<String?> get language => _localApi.getLanguage;

  set results(value) => _localApi.setResults(value);
  Future<String?> get results => _localApi.getResults;
}
