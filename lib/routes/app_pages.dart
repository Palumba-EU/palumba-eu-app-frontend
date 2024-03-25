import 'package:palumba_eu/modules/splash/splash_screen_binding.dart';
import 'package:palumba_eu/modules/splash/splash_screen_page.dart';
import 'package:get/route_manager.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
