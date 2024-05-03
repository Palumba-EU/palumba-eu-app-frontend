import 'dart:convert';

import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/alert.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
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
    //Set language
    final currentLanguage = (await _localDataRepository.language) ?? '';
    LanguageManager.currentLanguage = currentLanguage.isEmpty
        ? (Get.locale?.languageCode ?? 'en')
        : currentLanguage;
    UserManager.setLanguageCode(LanguageManager.currentLanguage);

    //Set country
    final currentCountry = (await _localDataRepository.country) ?? '';
    if (currentCountry.isNotEmpty) {
      UserManager.setCountry(Country.fromJson(jsonDecode(currentCountry)));
    }

    var response = await _dataRepository.fetchLocalizations();
    if (response == null) {
      Alert.showAlert(S.of(Get.context!).appName,
          S.of(Get.context!).splashPageNoInternet, Get.context!);
      return;
    }

    var response2 = await _dataRepository.fetchStatements();
    if (response2 == null) {
      Alert.showAlert(S.of(Get.context!).appName,
          S.of(Get.context!).splashPageNoInternet, Get.context!);
      return;
    }

    //Navigation
    final onBoarded = await _localDataRepository.onBoarded;
    if (onBoarded != null && onBoarded) {
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
