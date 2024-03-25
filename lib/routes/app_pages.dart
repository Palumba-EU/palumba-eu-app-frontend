import 'package:palumba_eu/modules/splash/splash_binding.dart';
import 'package:palumba_eu/modules/splash/splash_controller.dart';
import 'package:palumba_eu/modules/splash/splash_page.dart';
import 'package:get/route_manager.dart';
import 'package:palumba_eu/modules/welcome/language/language_binding.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/modules/welcome/language/language_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: SplashController.route,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: LanguageController.route,
      page: () => const LanguagePage(),
      binding: LanguageBinding(),
    ),
  ];
}
