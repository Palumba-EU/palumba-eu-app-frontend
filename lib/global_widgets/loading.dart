import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color? indicatorColor;

  const Loading({Key? key, this.indicatorColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor:
          AlwaysStoppedAnimation<Color>(indicatorColor ?? Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
