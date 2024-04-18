import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class LanguageController extends GetxController {
  static const route = '/language';

  List<Language>? _languages = DataManager().getLanguages();

  List<Language>? get languages => _languages;

  RxInt indexSelected = 0.obs;

  /**
   * On Click Actions
   */
  void onLanguagePressed(int index) {
    indexSelected.value = index;
  }

  void onContinueTap() {
    UserManager.setLanguageId(languages![indexSelected.value].id!);
    LanguageManager.setLanguage(languages![indexSelected.value].languagecode!);
    Get.offAllNamed(EntranceController.route);
  }
}
