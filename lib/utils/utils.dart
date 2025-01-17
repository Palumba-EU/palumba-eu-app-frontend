import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

  static Color getApiColor(String colorHex) {
    return Color(int.parse('0xff' + colorHex.substring(1)));
  }

  static Future<String> appVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> buildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
}
