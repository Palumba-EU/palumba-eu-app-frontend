import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/alert.dart';
import 'package:palumba_eu/utils/utils.dart';

class SplashController extends GetxController {
  static const route = '/splash';

  final DataRepository _dataRepository = Get.find<DataRepository>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    var response = await _dataRepository.fetchLocalizations();
    if (response == null) {
      //TODO: Strings
      Alert.showAlert(
          'Palumba', 'Sembla que no tens connexió a Internet', Get.context!);
      return;
    }

    Utils.languages = response.languages;
    Utils.countries = response.countries;

    Get.offNamed(
      LanguageController.route,
    );
  }
}
