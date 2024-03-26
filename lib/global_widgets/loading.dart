import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color? indicatorColor;
  final double? scale;

  const Loading({
    Key? key,
    this.indicatorColor,
    this.scale = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
              indicatorColor ?? Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
