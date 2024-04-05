import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

/// Class used to print console messages only in Development environment with
/// a format cute enough to differentiate at first sight a custom logger
/// message from a Flutter/System/External Library debug message.
class Logger {
  static const _showTime = true;

  static void v(String verboseMessage, {bool forcePrint = false, bool showTime = true}) =>
      _printMessageSplit('⬜️', verboseMessage, forcePrint, showTime);

  static void d(String debugMessage, {bool forcePrint = false, bool showTime = true}) =>
      _printMessageSplit('🟦', debugMessage, forcePrint, showTime);

  static void i(String infoMessage, {bool forcePrint = false, bool showTime = true}) =>
      _printMessageSplit('🟩', infoMessage, forcePrint, showTime);

  static void w(String warningMessage, {bool forcePrint = false, bool showTime = true}) =>
      _printMessageSplit('🟨', warningMessage, forcePrint, showTime);

  static void e(String errorMessage, {bool forcePrint = false, bool showTime = true}) =>
      _printMessageSplit('🟥', errorMessage, forcePrint, showTime);

  static void x(String msg, {bool forcePrint = false, bool showTime = false}) =>
      _printMessageSplit('', msg, forcePrint, showTime);

  static void _printMessageSplit(
    String color,
    String msg,
    bool forcePrint, [
    bool showTime = _showTime,
  ]) {
    if (!forcePrint && kReleaseMode) {
      return;
    }

    final list = msg.split('\n');
    for (var e in list) {
      debugPrint(
          // '$color${color.isEmpty ? '' : ' '}${showTime ? (_showTime ? '[${DateFormat('HH:mm:ss.S').format(DateTime.now())}]' : '') : ''} $e');
          '$color\u001B${_getColorEscape(color)}${color.isEmpty ? '' : ' '}${showTime ? '[${DateFormat('HH:mm:ss.S').format(DateTime.now())}] ' : ''}$e\u001b[0m');
    }
  }

  /// More info: https://en.wikipedia.org/wiki/ANSI_escape_code
  static String _getColorEscape(String color) {
    final String colorEscape;
    switch (color) {
      case '🟦':
        colorEscape = '[34m'; // blue
        break;
      case '🟩':
        colorEscape = '[32m'; // green
        break;
      case '🟨':
        colorEscape = '[33m'; // yellow
        break;
      case '🟥':
        colorEscape = '[31m'; // red
        break;
      default:
        colorEscape = '[97m'; // bright white
    }
    return colorEscape;
  }
}
