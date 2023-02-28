import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_page.dart';
import 'package:flutter_boilerplate/routes/app_pages.dart';
import 'package:flutter_boilerplate/styles/app_theme.dart';
import 'package:flutter_boilerplate/utils/dependency_injection.dart';
import 'package:flutter_boilerplate/utils/managers/dark_theme_manager.dart';
import 'package:flutter_boilerplate/utils/managers/get_manager.dart';
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

  bool isInDebugMode = EnvironmentConfig.environment == "dev";
  if (isInDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!isInDebugMode);
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  runZonedGuarded(() {
    setup();
    runApp(MyApp());
  }, FirebaseCrashlytics.instance.recordError);
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
    Styles.darkMode = themeChangeProvider.darkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          Styles.darkMode = !Styles.darkMode;
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: EnvironmentConfig.environment == "dev",
            title: 'FlutterBoilerplate',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: const SplashPage(),
            initialBinding: SplashBinding(),
            getPages: AppPages.pages,
            navigatorObservers: [
              //FirebaseAnalyticsObserver(analytics: Utils.getAnalytics()),
            ],
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
