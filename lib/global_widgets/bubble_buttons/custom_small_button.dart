import 'dart:math';

import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSmallButtonCurve extends StatelessWidget {
  const CustomSmallButtonCurve(
      {Key? key,
      required this.isSelected,
      this.curveRadius = 200,
      required this.icon,
      required this.onTap,
      this.flip = false})
      : super(key: key);

  final bool isSelected;
  final double curveRadius;
  final IconData? icon;
  final bool flip;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary;
    final borderColor = isSelected
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.background;
    return Stack(
      children: [
        Transform.flip(
          flipX: flip,
          child: Container(
            margin: EdgeInsets.only(top: DUI.spacing.largeLateralPaddingValue),
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onTap: onTap,
              child: CustomPaint(
                painter: _CustomSmallButtonPainter._CustomBigButtonPainter(
                    curveRadius: curveRadius,
                    color: color,
                    borderColor: borderColor),
              ),
            ),
          ),
        ),
        Positioned(
            top: DUI.spacing.largeLateralPaddingValue * 2,
            bottom: 0,
            right: flip ? Get.width * .1 : 0,
            left: flip ? 0 : Get.width * .1,
            child:
                IgnorePointer(child: Icon(icon, size: 35, color: borderColor))),
      ],
    );
  }
}

class _CustomSmallButtonPainter extends CustomPainter {
  final double curveRadius;
  final Color? color;
  final Color borderColor;
  final double borderWidth;

  _CustomSmallButtonPainter._CustomBigButtonPainter(
      {required this.curveRadius,
      required this.color,
      this.borderColor = Colors.white,
      this.borderWidth = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw filled shape
    paint.color = color ?? Theme.of(Get.context!).colorScheme.primary;
    paint.style = PaintingStyle.fill;
    _drawShape(canvas, size, paint);

    // Draw border
    paint.color = borderColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = borderWidth;
    _drawShapeBorder(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * .5, 0, size.width, curveRadius);

    path.lineTo(size.width, curveRadius);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  void _drawShapeBorder(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * .5, 0, size.width, curveRadius);

    path.lineTo(size.width, curveRadius);
    //path.lineTo(size.width, size.height);
    //path.lineTo(0, size.height);
    //path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


/*


// Start at the top left corner
    path.moveTo(size.width, size.height);

    // Draw a line to the bottom left corner
    path.lineTo(curveRadius, size.height);

    // Draw a curved line to the top right corner
    path.quadraticBezierTo(size.width * .5, size.height - curveRadius,
        size.width + curveRadius, size.height - curveRadius);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.close();

*/