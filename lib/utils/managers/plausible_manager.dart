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

  // Todo: Track a statement
  static Future<void> trackStatement(int id) async {
    await _plausible
        .event(name: 'statement', props: {'statement_id': id.toString()});
  }
}
