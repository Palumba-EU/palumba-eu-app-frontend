import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_controller.dart';
import 'package:get/get.dart';

import '../../styles/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  _getBackgroundImage(),
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height,
                ),
                SafeArea(
                  child: Padding(
                    child: Styles.h2TitleText(context, 'Welcome to noizz.',
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(Styles.paddingValue),
                  ),
                )
              ],
            ),
          )),
    );
  }

  _getBackgroundImage() {
    var date = DateTime.now();
    if (date.hour > 8 && date.hour <= 14) {
      return 'assets/images/003.png';
    } else if (date.hour > 14 && date.hour <= 19) {
      return 'assets/images/002.png';
    }
    return 'assets/images/001.png';
  }
}
