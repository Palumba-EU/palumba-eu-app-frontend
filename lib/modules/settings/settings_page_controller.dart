import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';

class SettingsPageController extends GetxController {
  static const route = '/settings';

  final String rebuildLanguageKey = 'rebuildLanguage';

  List<Language>? _languages = DataManager().getLanguages();

  List<Language>? get languages => _languages;

  Language? get SelectedLang => _languages?.firstWhere(
      (lang) => lang.languagecode == (LanguageManager.currentLanguage));

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  goToSelectLanguage() async {
    final result = await Get.toNamed(LanguageController.route);
    if (result == true) {
      update([rebuildLanguageKey]);
    }
  }
}
