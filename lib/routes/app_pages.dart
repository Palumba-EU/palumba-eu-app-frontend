import 'package:flutter_boilerplate/modules/main/main_binding.dart';
import 'package:flutter_boilerplate/modules/purchase/purchase_binding.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_binding.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_page.dart';
import 'package:flutter_boilerplate/modules/volume/volume_page.dart';
import 'package:get/route_manager.dart';
import '../modules/main/main_page.dart';
import '../modules/purchase/purchase_page.dart';
import '../modules/volume/volume_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 200),
        name: AppRoutes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 200),
        name: AppRoutes.main,
        page: () => const MainPage(),
        binding: MainBinding()),
    GetPage(
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 200),
        opaque: false,
        name: AppRoutes.volume,
        page: () => const VolumePage(),
        binding: VolumeBinding()),
    GetPage(
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 200),
        opaque: false,
        name: AppRoutes.purchase,
        page: () => const PurchasePage(),
        binding: PurchaseBinding()),
  ];
}
