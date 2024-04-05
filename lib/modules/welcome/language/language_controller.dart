import 'package:get/get.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';

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
    Get.offNamed(EntranceController.route);
  }
}
