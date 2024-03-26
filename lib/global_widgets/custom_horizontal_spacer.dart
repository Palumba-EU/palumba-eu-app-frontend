import 'package:flutter/material.dart';

class CustomHorizontalSpacer extends StatelessWidget {
  final int multiplier;
  final bool small;

  const CustomHorizontalSpacer({
    Key? key,
    this.multiplier = 1,
    this.small = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: small ? 2.5 : multiplier * 10,
    );
  }
}
