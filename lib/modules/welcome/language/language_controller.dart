import 'package:get/get.dart';
import 'package:palumba_eu/data/model/localization.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/utils/utils.dart';

class LanguageController extends GetxController {
  static const route = '/language';

  List<Language>? _languages = Utils.languages;

  List<Language>? get languages => _languages;

  RxInt indexSelected = 0.obs;

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
