import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/alert.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class SplashController extends GetxController {
  static const route = '/splash';

  final DataRepository _dataRepository = Get.find<DataRepository>();
  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    var response = await _dataRepository.fetchLocalizations();
    if (response == null) {
      //TODO: Strings
      Alert.showAlert('Palumba',
          'It looks like you don\'t have internet connection', Get.context!);
      return;
    }
    //Set language
    final currentLanguage = (await _localDataRepository.language) ?? '';
    LanguageManager.currentLanguage = currentLanguage.isEmpty
        ? (Get.locale?.languageCode ?? 'en')
        : currentLanguage;
    UserManager.setLanguageCode(LanguageManager.currentLanguage);
    _dataRepository.fetchStatements();

    final onBoarded = await _localDataRepository.onBoarded;
    if (onBoarded == true) {
      Get.offAllNamed(
        HomePageController.route,
      );
    } else {
      Get.offAllNamed(
        LanguageController.route,
      );
    }
  }
}
