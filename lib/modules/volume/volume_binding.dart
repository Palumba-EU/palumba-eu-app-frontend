import 'package:flutter_boilerplate/modules/volume/volume_controller.dart';
import 'package:get/get.dart';

class VolumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VolumeController());
  }
}
