import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

class DottedContainer extends StatelessWidget {
  const DottedContainer(
      {Key? key, required this.width, required this.height, this.pointColor})
      : super(key: key);
  final double width;
  final double height;
  final Color? pointColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: height,
      child: CustomPaint(
        painter: DottedRectanglePainter(
          pointColor: pointColor,
        ),
      ),
    );
  }
}

class DottedRectanglePainter extends CustomPainter {
  final Color? pointColor;

  DottedRectanglePainter({super.repaint, required this.pointColor});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = pointColor ?? AppColors.lightPrimary
      ..strokeWidth = 1.0;

    final stepWidth = size.width * .1;
    final stepHeight = size.height * .1;

    for (var x = 0.0; x <= size.width; x += stepWidth) {
      for (var y = 0.0; y <= size.height; y += stepHeight) {
        canvas.drawCircle(Offset(x, y), 1.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
