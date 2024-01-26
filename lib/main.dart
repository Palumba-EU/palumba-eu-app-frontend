import 'dart:async';
import 'dart:ui';
import 'package:dui/dui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_page.dart';
import 'package:flutter_boilerplate/routes/app_pages.dart';
import 'package:flutter_boilerplate/utils/dependency_injection.dart';
import 'package:flutter_boilerplate/utils/managers/dark_theme_manager.dart';
import 'package:flutter_boilerplate/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:flutter_boilerplate/utils/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'modules/splash/splash_screen_binding.dart';

class EnvironmentConfig {
  static const environment =
      String.fromEnvironment('ENV', defaultValue: 'prod');

  static bool get isDevelopmentMode => environment == 'dev';
}

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    DependencyInjection.init();

    await Firebase.initializeApp();

    await dotenv.load(
      fileName: EnvironmentConfig.isDevelopmentMode ? '.env.dev' : '.env.prod',
    );

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(
      error,
      StackTrace.current,
      reason: error.toString(),
      fatal: false,
    );
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context) {}

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: EnvironmentConfig.environment == "dev",
            title: 'FlutterBoilerplate',
            themeMode: ThemeMode.system,
            theme: DUI.theme.themeData(false),
            darkTheme: DUI.theme.themeData(true),
            home: const SplashPage(),
            initialBinding: SplashBinding(),
            getPages: AppPages.pages,
            /*navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: Utils.getAnalytics()),
            ],*/
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
