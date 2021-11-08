import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Container(
            child: Center(
              child: Image.asset(
                'assets/img/icons/splash.png',
                width: Get.width * 0.25,
                fit: BoxFit.fitWidth,
              ),
            ),
          )),
    );
  }
}
