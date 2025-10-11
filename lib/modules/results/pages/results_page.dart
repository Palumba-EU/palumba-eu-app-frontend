import 'package:flutter/material.dart';

mixin ResultsPage implements Widget {
  final bool showShare = true;
  final bool showBallotBoxBackground = false;
  final bool showDottedContainer = false;
  final bool showSpecialBackground = false;
  final bool showMemesBackground = false;
  final bool showGuidBackground = false;
  final bool showBackgroundOpinion = false;
  final bool showBackgroundTarget = false;
  String get className => runtimeType.toString();
}
