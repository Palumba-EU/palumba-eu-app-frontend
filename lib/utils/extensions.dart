import 'dart:convert';
import 'dart:io';
import 'dart:math' show Random;

import 'package:intl/intl.dart';

/// Nullable String.
extension StringNullableExt on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

//Iterables
extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

/// String.
extension StringExtensions on String {
  String chunk({required int size}) {
    if (length < size) {
      return this;
    } else {
      return substring(0, size);
    }
  }

  /// Returns the [bool] representation or null if this String can't be parsed
  /// to [bool].
  bool get toBool => this == 'true';

  /// Splits the String into the first occurrence and the other remaining occurrences are kept the same.
  ///
  /// ie: `'Foo Bar Doe'.splitFirst(' ')` --> [['Foo', 'Bar Doe']]
  List<String>? splitFirst(Pattern pattern, {String? joinSeparator}) {
    if (isEmpty) {
      return [''];
    }

    final listSplit = split(pattern);
    if (listSplit.length < 2) {
      return listSplit;
    }

    final newList = <String>[];
    newList.add(listSplit[0]);
    listSplit.removeAt(0);
    newList.add(listSplit.join(joinSeparator ?? pattern.toString()));
    return newList;
  }

  bool get isValidEmail =>
      RegExp(r'(^[\w-\.]+@([\w-]+\.)+[a-zA-Z-]{2,4}$)').hasMatch(this);

  bool get isValidSpanishLandline =>
      RegExp(r'^(\+34|0034|34)?(8|9)([0-9]){8}$').hasMatch(this);

  /// Checks whether this String is a valid (spanish) mobile phone number.
  ///
  /// - It must start with a 6 or 7
  /// - It must have 8 or 9 digits
  bool get isValidMobileNumber =>
      // final isValid = RegExp('^([+]\\d{2}[ ]?)?\\d{8,11}\$').hasMatch(this);
      RegExp('^[67]\\d{8}\$').hasMatch(this);

  bool get isValidPassword =>
      RegExp('((?=.*\\d)(?=.*[A-Z])(?=.*[a-z])\\w.{6,}\\w)').hasMatch(this);

  /// Checks whether this string is a valid DNI. It accepts both lowercase and uppercase.
  bool get isValidDni {
    const validChars = 'TRWAGMYFPDXBNJZSQVHLCKE';
    final regExp = RegExp("(^\\d{8})([$validChars])\$", caseSensitive: true);
    final isValid = regExp.hasMatch(this);
    if (!isValid) {
      return false;
    }

    final dniWithoutLetter = substring(0, length - 1);
    final position = int.parse(dniWithoutLetter) % 23;

    return (dniWithoutLetter + validChars[position]) == (this);
  }

  bool get isValidNie {
    const validChars = 'TRWAGMYFPDXBNJZSQVHLCKE';
    final regExp = RegExp("^[XYZ]\\d{7,8}[$validChars]\$", caseSensitive: true);
    final isValid = regExp.hasMatch(this);
    if (!isValid) {
      return false;
    }

    final String niePrefix;
    switch (this[0]) {
      case 'X':
        niePrefix = "0";
        break;
      case 'Y':
        niePrefix = "1";
        break;
      default:
        niePrefix = "2";
        break;
    }

    return (niePrefix + substring(1)).isValidDni;
  }

  bool get isValidCif => RegExp(
        "^([ABCDEFGHJKLMNPQRSUVW])(\\d{7})([0-9A-J])\$",
        caseSensitive: false,
      ).hasMatch(this);

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

extension BoolExtensions on bool? {
  int? get toInt {
    if (this == null) {
      return null;
    }

    return this! ? 1 : 0;
  }
}

extension IntExtension on int? {
  /// Returns whether the value to evaluate is much low as [low] param or
  /// as much high as [high] param.
  bool isWithinRangeInclusive(int low, int high) {
    assert(low <= high, "high number can't be lower than low number...");
    if (this == null) {
      return false;
    }
    return this! >= low && this! <= high;
  }

  bool? get toBool {
    if (this == null) {
      return null;
    }

    return this == 1;
  }
}

/// List.
extension IterableExtension<T, X> on Iterable<T>? {
  /// Returns whether this list is null or has no items.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Returns the first element or null if the list is null or empty.
  T? get firstOrNull => isNullOrEmpty ? null : this!.first;

  /// Returns the element matching the condition or null if no element is found.
  T? find(bool Function(T element) test) {
    if (this != null) {
      for (T element in this!) {
        if (test(element)) return element;
      }
    }

    return null;
  }

  /// Returns the index of the element matching the condition or -1 if no element matches the condition.
  int findIndex(bool Function(T element) test) {
    if (this != null) {
      for (int i = 0; i < this!.length; i++) {
        if (test(this!.elementAt(i))) {
          return i;
        }
      }
    }

    return -1;
  }

  /// Returns the element at the given [index] or null if [RangeError] or other
  /// exception is thrown.
  T? elementAtOrNull(int index) {
    try {
      return this?.elementAt(index);
    } catch (_) {}
    return null;
  }

  /// Returns whether the element at [index] is the last one.
  bool isLast(int index) => index == (this?.length ?? 0) - 1;

  T? get last => this == null ? null : this!.elementAt(this!.length - 1);

  T? get lastOrNull => isNullOrEmpty ? null : last;

  /// Returns a random element or null if the list is empty or null.
  T? get random {
    if (isNullOrEmpty) {
      return null;
    }

    final Random r = Random();
    return this!.elementAt(r.nextInt(this!.length));
  }

  /// Returns whether this list contains the same elements as [otherList].
  ///
  /// Does not take in account if those elements have the same position in both
  /// lists.
  bool isEquals(List<T>? otherList) {
    if (this?.length != otherList?.length) {
      return false;
    }

    for (var e in (this ?? <T>[])) {
      if (!(otherList?.contains(e) ?? false)) {
        return false;
      }
    }

    return true;
  }

  int? count(bool Function(T element) test) =>
      this?.where((e) => test(e)).length;

  /// Similar to [Iterable.take], but starts taking from [from].
  ///
  /// Example:
  /// ```
  /// final list = [1, 4, 5, 6, 3, 9, 11, 12];
  /// final result = list.take(5, 2);   // [5, 6, 3, 9, 11]
  /// final result2 = list.take(3, 3);  // [6, 3, 9]
  /// final result3 = list.take(1, 5);  // [9]
  /// final result4 = list.take(-1, 5);  // [9, 11, 12]
  /// ```
  ///
  /// - If [count] is set as -1, it'll take all the items.
  /// - If [from] is set as -1, it'll start from the start.
  Iterable<T> takeFrom(int count, int from) {
    assert(from <= (this?.length ?? 0),
        '`from` value must be lower than this iterable length');

    final list = <T>[];
    if (this == null) {
      return list;
    }

    if (count == -1) {
      count = this!.length;
    }

    if (from == -1) {
      from = 0;
    }

    int currentIndex = 0;
    for (var item in this!) {
      if (list.length >= count) {
        break;
      }

      // if ((from < 0 && currentIndex > from) || currentIndex >= from) {
      if (currentIndex >= from) {
        list.add(item);
      }
      currentIndex++;
    }
    return list;
  }

  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    var index = 0;
    for (var element in (this ?? <T>[])) {
      yield convert(index++, element);
    }
  }
}

extension ListExt on List<int> {
  List<int> from({required int begin, required int end, bool reverse = false}) {
    assert(!(begin > end && !reverse) || !(end < begin && !reverse));
    final List<int> list = [];
    if (reverse) {
      for (int i = begin; i >= end; i--) {
        list.add(i);
      }
    } else {
      for (int i = begin; i <= end; i++) {
        list.add(i);
      }
    }
    return list;
  }
}

/// Set.
extension SetExtension<T> on Set<T> {
  bool containsAny(Set<T> elements) {
    for (var e in this) {
      if (elements.contains(e)) {
        return true;
      }
    }
    return false;
  }
}

/// Map.
extension MapExtension on Map? {
  /// Whether this Map is null or has no entries.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String? get jsonPrettified {
    if (this == null) {
      return null;
    }

    try {
      return const JsonEncoder.withIndent('  ').convert(this);
    } catch (e) {
      return '$this';
    }
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

/// File.
extension FileExtension on File {
  /// The name of the file with the extension.
  String get fileName => path.split(Platform.pathSeparator).last;

  /// The name of the file without the extension.
  String get fileNameWithoutExtension => fileName.split(".").first;

  String? get fileExtension =>
      fileName.contains('.') ? fileName.split('.').lastOrNull : null;
}

extension DateTimeExtension on DateTime {
  bool get isToday =>
      year == DateTime.now().year &&
      month == DateTime.now().month &&
      day == DateTime.now().day;

  bool get isYesterday =>
      DateTime.now().subtract(const Duration(days: 1)).isToday;

  bool get isTomorrow => DateTime.now().add(const Duration(days: 1)).isToday;

  String format(String format, [String? locale]) =>
      DateFormat(format, locale).format(this);

  bool isSameDay(DateTime otherDate) =>
      otherDate.difference(this).inDays == 0 && otherDate.day == day;

  DateTime addYears(int years) => DateTime(year + years, month, day);

  DateTime addMonths(int months) => DateTime(year, month + months, day);

  DateTime addDays(int days) => DateTime(year, month, day + days);
}
