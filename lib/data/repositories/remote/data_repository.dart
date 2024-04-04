import 'package:palumba_eu/data/model/localization.dart';
import 'package:palumba_eu/data/provider/remote/data_api.dart';
import 'package:get/get.dart';

class DataRepository {
  final DataAPI _api = Get.find<DataAPI>();

  Future<Localization?> fetchLocalizations() => _api.fetchLocalizations();
}
