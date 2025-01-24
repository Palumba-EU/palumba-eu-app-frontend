import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/plausible_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class LanguageController extends GetxController {
  static const route = '/language';

  final DataRepository _dataRepository = Get.find<DataRepository>();
  final LocalDataRepository _localDataRepository =
      Get.find<LocalDataRepository>();

  ScrollController scrollController = ScrollController();

  List<Language>? _languages = DataManager().getLanguages();

  List<Language>? get languages => _languages;

  RxInt indexSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();
    PlausibleManager.trackPage(route);
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
    final index = languages!
        .indexWhere((element) => element.languagecode == currentLanguage);
    if (index != -1) {
      indexSelected.value = index;
      _localDataRepository.language =
          languages![indexSelected.value].languagecode!;
      LanguageManager.setLanguage(
          languages![indexSelected.value].languagecode!);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo((65 * index).toDouble(),
          duration: Durations.short1, curve: Curves.easeIn);
    });
  }

  /**
   * On Click Actions
   */
  void onLanguagePressed(int index) {
    indexSelected.value = index;

    UserManager.setLanguageCode(languages![indexSelected.value].id!.toString());
    LanguageManager.setLanguage(languages![indexSelected.value].languagecode!);
    _localDataRepository.language =
        languages![indexSelected.value].languagecode!;
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
