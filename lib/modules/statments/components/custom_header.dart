import 'package:dui/dui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_drawing/path_drawing.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DUI.spacing.spacer(multiplier: 2),
        SizedBox(
          width: double.infinity,
          child: CustomPaint(painter: _CustomHeaderPainter()),
        ),
        DUI.spacing.spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius:
                    BorderRadius.circular(DUI.spacing.largeBorderRadius),
              ),
              child: Icon(Icons.arrow_back),
            ),
            DUI.text.title1(context, 'Palumba',
                color: Theme.of(context).colorScheme.primary),
            Container(
              height: 40,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius:
                    BorderRadius.circular(DUI.spacing.largeBorderRadius),
              ),
              child: Icon(Icons.house_outlined),
            ),
          ],
        ),
        DUI.spacing.spacer(multiplier: 2),
        SizedBox(
          width: double.infinity,
          child: CustomPaint(painter: _CustomHeaderPainter()),
        ),
        DUI.spacing.spacer(multiplier: 2),
      ],
    );
  }
}

class _CustomHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw filled shape
    paint.color = Theme.of(Get.context!).colorScheme.primary;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = .8;
    _drawShape(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(0, 10);
    path.quadraticBezierTo(size.width * .5, -20, size.width, 10);
    var curvePath = dashPath(path, dashArray: CircularIntervalList([8, 5]));
    canvas.drawPath(curvePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
