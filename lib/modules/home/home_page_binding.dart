import 'package:get/get.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
