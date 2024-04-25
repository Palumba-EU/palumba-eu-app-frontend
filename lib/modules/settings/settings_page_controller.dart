import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/string_utils.dart';
import 'package:palumba_eu/utils/utils.dart';

class SettingsPageController extends GetxController {
  static const route = '/settings';

  final String rebuildLanguageKey = 'rebuildLanguage';

  List<Language>? _languages = DataManager().getLanguages();

  List<Language>? get languages => _languages;

  Language? get selectedLang => getSelectedLanguage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Language? getSelectedLanguage() {
    try {
      return _languages?.firstWhere(
          (lang) => lang.languagecode == (LanguageManager.currentLanguage));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  goToSelectLanguage() async {
    final result = await Get.toNamed(LanguageController.route);
    if (result == true) {
      update([rebuildLanguageKey]);
    }
  }

  void launchPrivacyPoliciesUrl() {
    Utils.launch(StringUtils.privacyStatementUrl);
  }

  void launchFaqUrl() {
    Utils.launch(StringUtils.faqUrl);
  }

  void shareApp() {
    //TODO
  }
}
