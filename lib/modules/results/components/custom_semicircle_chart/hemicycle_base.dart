import 'dart:math';

import 'package:flutter/material.dart';

class HemicycleBase extends StatelessWidget {
  final double arcDiameter;
  final Color color;
  const HemicycleBase({
    Key? key,
    required this.arcDiameter,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArcPainter(
        arcDiameter: arcDiameter,
        lineWidth: arcDiameter * .065,
        color: color,
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  ArcPainter(
      {required this.arcDiameter,
      required this.lineWidth,
      required this.color});

  final double arcDiameter;
  final double lineWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw 7 arcs
    for (int i = 0; i < 7; i++) {
      final currentDiameter = arcDiameter - i * (arcDiameter / 7);
      final rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: currentDiameter,
        height: currentDiameter * 1.08,
      );

      final startAngle = -pi / 2;
      final sweepAngle = pi * 2;
      if (i == 6) {
        canvas.drawArc(rect, -startAngle, sweepAngle, false, fillPaint);
      }
      canvas.drawArc(rect, -startAngle, sweepAngle, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
