import 'package:get/get.dart';
import 'package:palumba_eu/data/provider/local/local_data_api.dart';
import 'package:palumba_eu/data/provider/remote/data_api.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';

import '../data/repositories/remote/data_repository.dart';

class DependencyInjection {
  static void init() {
    //Remote Data
    Get.put<DataAPI>(DataAPI());
    Get.put<DataRepository>(DataRepository());

    //Local Data
    Get.put<LocalDataAPI>(LocalDataAPI());
    Get.put<LocalDataRepository>(LocalDataRepository());
  }
}
