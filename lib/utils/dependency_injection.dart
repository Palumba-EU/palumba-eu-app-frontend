import 'package:get/get.dart';
import 'package:palumba_eu/data/provider/remote/data_api.dart';

import '../data/repositories/remote/data_repository.dart';

class DependencyInjection {
  static void init() {
    //Data
    Get.put<DataAPI>(DataAPI());
    Get.put<DataRepository>(DataRepository());
  }
}
