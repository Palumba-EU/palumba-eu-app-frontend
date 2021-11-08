import 'package:flutter_boilerplate/modules/login/login_binding.dart';
import 'package:flutter_boilerplate/modules/login/login_page.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_binding.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_page.dart';
import 'package:get/route_manager.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOG_IN,
      page: () => LogInPage(),
      binding: LogInBinding(),
    ),
  ];
}