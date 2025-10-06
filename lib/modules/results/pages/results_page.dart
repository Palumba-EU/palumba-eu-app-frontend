import 'package:flutter/material.dart';

mixin ResultsPage implements Widget {
  final bool showShare = true;
  final bool showBallotBoxBackground = false;
  final bool showDottedContainer = false;
  final bool showSpecialBackground = false;
  final bool showMemesBackground = false;
  String get className => runtimeType.toString();
}
