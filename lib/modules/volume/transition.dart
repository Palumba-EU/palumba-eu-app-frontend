import 'dart:ui';

import 'package:flutter/cupertino.dart';

class FrostTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  FrostTransition({required this.animation, required this.child})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: animation.value, sigmaY: animation.value),
        child: Container(
          child: child,
        ),
      );
}
