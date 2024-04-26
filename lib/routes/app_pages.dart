import 'package:palumba_eu/modules/home/home_page.dart';
import 'package:palumba_eu/modules/home/home_page_binding.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_binding.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_controller.dart';
import 'package:palumba_eu/modules/onboarding/onboarding_page.dart';
import 'package:palumba_eu/modules/results/RESULTS_binding.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_binding.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/modules/results/results_page.dart';
import 'package:palumba_eu/modules/settings/settings_page.dart';
import 'package:palumba_eu/modules/settings/settings_page_binding.dart';
import 'package:palumba_eu/modules/settings/settings_page_controller.dart';
import 'package:palumba_eu/modules/splash/splash_binding.dart';
import 'package:palumba_eu/modules/splash/splash_controller.dart';
import 'package:palumba_eu/modules/splash/splash_page.dart';
import 'package:get/route_manager.dart';
import 'package:palumba_eu/modules/statments/statements_screen_binding.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/modules/statments/statements_screen_page.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_binding.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_page.dart';
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
      name: HomePageController.route,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: LanguageController.route,
      page: () => const LanguagePage(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: EntranceController.route,
      page: () => const EntrancePage(),
      binding: EntranceBinding(),
    ),
    GetPage(
      name: OnboardingController.route,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: LoadingResultsController.route,
      page: () => const LoadingResultsPage(),
      binding: LoadingResultsBinding(),
    ),
    GetPage(
      name: ResultsController.route,
      page: () => const ResultsPage(),
      binding: ResultsBinding(),
    ),
    GetPage(
      name: SettingsPageController.route,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
        transition: Transition.noTransition,
        transitionDuration: Duration.zero,
        name: StatementsController.route,
        page: () => StatementsPage(),
        binding: StatementsBinding())
  ];
}
