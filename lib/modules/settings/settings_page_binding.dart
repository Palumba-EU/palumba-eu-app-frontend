import 'package:get/get.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';

class SettingsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsPageController());
  }
}
