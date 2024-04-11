import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/data/provider/remote/data_api.dart';
import 'package:get/get.dart';

class DataRepository {
  final DataAPI _api = Get.find<DataAPI>();

  Future<LocalizationData?> fetchLocalizations() => _api.fetchLocalizations();

  Future<StatementsData?> fetchStatements() => _api.fetchStatements();

  Future<bool> setResponse(UserData userData) => _api.setResponse(userData);

  Future<ResultsData?> fetchResultsInfo() => _api.fetchResultsInfo();
}
