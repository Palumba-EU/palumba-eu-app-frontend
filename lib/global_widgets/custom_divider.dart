import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    this.width,
    this.paddingValue,
    this.color,
    super.key,
  });
  final double? width;
  final double? paddingValue;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: paddingValue ?? 0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color ?? Colors.white.withAlpha((0.5 * 255).toInt()),
            width: width ?? 3,
          ),
        ),
      ),
    );
  }
}
