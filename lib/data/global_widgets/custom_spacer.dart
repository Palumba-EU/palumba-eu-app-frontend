import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  final int multiplier;
  final bool small;

  const CustomSpacer({
    Key? key,
    this.multiplier = 1,
    this.small = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: small ? 5 : multiplier * 10,
    );
  }
}
