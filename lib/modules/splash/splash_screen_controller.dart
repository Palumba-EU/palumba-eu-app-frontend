import 'package:flutter_boilerplate/routes/app_routes.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

import '../../data/audio_manager.dart';
import '../../data/preset_manager.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _init();
    super.onReady();
  }

  _init() async {
    await PresetManager().loadData();
    await AudioManager().loadAssets();
    Future.delayed(const Duration(seconds: 1), () {
      Get.toNamed(AppRoutes.main);
    });
  }
}
