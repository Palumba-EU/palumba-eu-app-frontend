import 'package:palumba_eu/modules/splash/splash_page.dart';
import 'package:palumba_eu/routes/app_pages.dart';
import 'package:palumba_eu/utils/dependency_injection.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/splash/splash_binding.dart';
import 'utils/common_ui/app_theme_data.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'utils/managers/language_manager.dart';

class EnvironmentConfig {
  static const environment =
      String.fromEnvironment('ENV', defaultValue: 'prod');

  static bool get isDevelopmentMode => environment == 'dev';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.init();

  LanguageManager.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (EnvironmentConfig.isDevelopmentMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      await Sentry.captureException(
        details.exception,
        stackTrace: details.stack,
      );
    }
  };

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context) {}

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palumba',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemeData.themeData(false),
      darkTheme: AppThemeData.themeData(false),
      locale: Locale(LanguageManager.currentLanguage),
      home: const SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
