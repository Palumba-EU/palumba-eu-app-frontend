import 'package:palumba_eu/data/repositories/remote/user_repository.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/modules/welcome/language/models/language_data.dart';

class LanguageController extends GetxController {
  static const route = '/language';

  final List<LanguageData> _languages = [
    LanguageData(asset: 'assets/images/flags/hungary.svg', text: 'Hrvatski'),
    LanguageData(asset: 'assets/images/flags/denmark.svg', text: 'Dansk'),
    LanguageData(asset: 'assets/images/flags/germany.svg', text: 'Deutsch'),
    LanguageData(asset: 'assets/images/flags/spain.svg', text: 'Castellano'),
    LanguageData(
        asset: 'assets/images/flags/united_kingdom.svg', text: 'English'),
    LanguageData(asset: 'assets/images/flags/france.svg', text: 'Français'),
    LanguageData(asset: 'assets/images/flags/poland.svg', text: 'Polski'),
    LanguageData(asset: 'assets/images/flags/romania.svg', text: 'Romana'),
    LanguageData(asset: 'assets/images/flags/sweden.svg', text: 'Svenska'),
  ];

  List<LanguageData> get languages => _languages;

  RxInt indexSelected = 4.obs;

  /**
   * On Click Actions
   */
  void onLanguagePressed(int index) {
    indexSelected.value = index;
  }

  void onContinueTap() {
    Get.offNamed(EntranceController.route);
  }
}
