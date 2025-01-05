import 'package:get/get.dart';
import 'election_controller.dart';

class ElectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ElectionController());
  }
}
