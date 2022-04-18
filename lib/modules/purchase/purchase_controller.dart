import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../data/models/assets.dart';

class PurchaseController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  toVolume(Asset asset) async {
    await Get.toNamed(AppRoutes.volume, arguments: [asset]);
    update();
  }
}
