import 'package:get/get.dart';
import 'statements_screen_controller.dart';

class StatementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatementsController());
  }
}
