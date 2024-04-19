import 'package:palumba_eu/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  // /*
  // * Launcher
  // * */

  static Future<bool> launch(String url, [LaunchMode? mode]) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: mode ?? LaunchMode.platformDefault);
      return true;
    } catch (e) {
      Logger.w(' Could not launch $url: $e');
    }
    return false;
  }
}
