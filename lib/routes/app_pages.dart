import 'package:bondy/modules/login/login_binding.dart';
import 'package:bondy/modules/login/login_page.dart';
import 'package:bondy/modules/splash/splash_screen_binding.dart';
import 'package:bondy/modules/splash/splash_screen_page.dart';
import 'package:get/route_manager.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.logIn,
      page: () => const LogInPage(),
      binding: LogInBinding(),
    ),
  ];
}