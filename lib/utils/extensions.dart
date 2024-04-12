/// Nullable String.
extension StringNullableExt on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

/// String.
extension StringExtensions on String {
  String capitalize() {
    final firstLetter = this[0].toUpperCase();
    return '$firstLetter${substring(1, length)}';
  }

  String decapitalize() {
    String firstLetter = this[0].toLowerCase();
    return '$firstLetter${substring(1, length)}';
  }

  String capitalizeWhere(bool Function(String word) condition) {
    final output = StringBuffer();
    final split = this.split(' ');
    for (int i = 0; i < split.length; i++) {
      final s = split[i];
      if (condition(s)) {
        output.write(s.capitalize());
      } else {
        output.write(s);
      }
      if (i < split.length - 1) {
        output.write(' ');
      }
    }

    return output.toString();
  }
}

/// Double.
extension DoubleExtension on double {
  /// Improved version of `toStringAsFixed()`, adding extra '0' when needed.
  String toStringAsFixed2(int maxDecimalNumbers) {
    if (this % 1 == 0) {
      // The number has no decimals.
      return toInt().toString();
    }

    final valueAsStringFixed = toStringAsFixed(maxDecimalNumbers);

    if (double.parse(valueAsStringFixed) == 0) {
      return '0';
    }

    return valueAsStringFixed;
  }
}
