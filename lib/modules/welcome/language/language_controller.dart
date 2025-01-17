import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class LanguageController extends GetxController {
  static const route = '/language';

  final DataRepository _dataRepository = Get.find<DataRepository>();
  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  ScrollController scrollController = ScrollController();

  List<Language> _languages = DataManager().getLanguages();

  List<Language> get languages => _languages;

  RxInt indexSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    selectCurrentLanguage();
  }

  /**
   * Initial Actions
   */
  void selectCurrentLanguage() {
    final currentLanguage = LanguageManager.currentLanguage;
    final indexMatchingCurrent = languages.indexWhere(
        (element) => element.languagecode?.toLowerCase() == currentLanguage);
    final indexMatchingEn = languages
        .indexWhere((element) => element.languagecode?.toLowerCase() == "en");

    if (indexMatchingCurrent != -1) {
      // match already used language
      _saveLanguage(indexMatchingCurrent);
    } else if (indexMatchingEn != -1) {
      // fallback match en
      _saveLanguage(indexMatchingEn);
    } else if (languages.length > 0) {
      // fallback match first language in array
      _saveLanguage(0);
    } else {
      // TODO: this case should also be handled in the UI
      debugPrint('no languages available');
    }
  }

  void _saveLanguage(int index) {
    indexSelected.value = index;

    final languageCode = languages[index].languagecode!;
    _localDataRepository.language = languageCode;
    LanguageManager.setLanguage(languageCode);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final maxScrollExtent = scrollController.position.maxScrollExtent;
      final targetOffset = (65 * index).toDouble();

      if (targetOffset <= maxScrollExtent) {
        scrollController.animateTo(
          targetOffset,
          duration: Durations.short1,
          curve: Curves.easeIn,
        );
      }
    });
  }

  /**
   * On Click Actions
   */
  void onLanguagePressed(int index) {
    indexSelected.value = index;

    UserManager.setLanguageCode(languages[indexSelected.value].id!.toString());
    LanguageManager.setLanguage(languages[indexSelected.value].languagecode!);
    _localDataRepository.language =
        languages[indexSelected.value].languagecode!;
  }

  void onContinueTap() async {
    _dataRepository.fetchStatements();

    final args = Get.arguments;
    if (args == 'fromElection') {
      Get.until((route) => route.settings.name == SettingsPageController.route);
      return;
    }

    final isOnboarded = await _localDataRepository.onBoarded;
    if (isOnboarded != null && isOnboarded) {
      Get.back(result: true);
      return;
    }

    Get.offAllNamed(EntranceController.route);
  }
}
