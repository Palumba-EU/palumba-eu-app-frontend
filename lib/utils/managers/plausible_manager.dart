import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:plausible_analytics/plausible_analytics.dart';

class PlausibleManager {
  static final PlausibleManager _instance = PlausibleManager._internal();
  factory PlausibleManager() => _instance;

  PlausibleManager._internal();

  static final _plausible =
      Plausible('https://plausible.io', 'palumba-app.palumba.eu');

  static Plausible getInstance() {
    return _plausible;
  }

  static Future<void> trackPage(String route) async {
    await _plausible.event(name: 'pageview', page: trimRoute(route));
  }

  static Future<void> trackStatement(String id) async {
    var statementUrl = trimRoute(StatementsController.route);
    await _plausible.event(name: 'pageview', page: '$statementUrl/$id');
  }

  static Future<void> trackResult(String id) async {
    var resultUrl = trimRoute(ResultsController.route);
    await _plausible.event(name: 'pageview', page: '$resultUrl/$id');
  }

  // Remove leading slash from route
  static String trimRoute(String route) {
    return route.replaceFirst(RegExp(r'^/'), '');
  }
}
