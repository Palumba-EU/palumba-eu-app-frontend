import 'package:firebase_core/firebase_core.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_binding.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_page.dart';
import 'package:palumba_eu/modules/splash/splash_page.dart';
import 'package:palumba_eu/routes/app_pages.dart';
import 'package:palumba_eu/utils/dependency_injection.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/splash/splash_binding.dart';
import 'utils/common_ui/app_theme_data.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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

  await SentryFlutter.init((options) {
    options.dsn =
        'https://f9be67a04b24e1ee4c1dd9c1b2a13f19@o1288946.ingest.sentry.io/4506773258371072';

    options.tracesSampleRate = 1.0;
  }, appRunner: () {
    runApp(MyApp());
  });
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
      debugShowCheckedModeBanner: EnvironmentConfig.environment == "dev",
      title: 'Palumba',
      themeMode: ThemeMode.system,
      theme: AppThemeData.themeData(false),
      darkTheme: AppThemeData.themeData(false),
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
