import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

class GraphicAxis extends StatelessWidget {
  final Color? lineColor;
  final String assetImage;
  const GraphicAxis({Key? key, this.lineColor, required this.assetImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: GraphicAxisPainter(
            lineColor: lineColor,
          ),
          child: Container(),
        ),
        Center(
            child: SvgPicture.asset(
          'assets/images/ic_compass.svg',
        ))
      ],
    );
  }
}

class GraphicAxisPainter extends CustomPainter {
  final Color? lineColor;

  GraphicAxisPainter({super.repaint, required this.lineColor});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor ?? AppColors.lightPrimary
      ..strokeWidth = 4.0;

    // Dibuja la línea vertical de la cruz
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    // Dibuja la línea horizontal de la cruz
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
