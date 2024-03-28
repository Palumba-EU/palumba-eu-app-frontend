import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBigButtonCurve extends StatelessWidget {
  const CustomBigButtonCurve(
      {Key? key,
      required this.icon,
      this.curveRadius = 25,
      required this.isSelected,
      required this.onTap,
      this.flip = false})
      : super(key: key);
  final IconData icon;

  final double curveRadius;
  final bool isSelected;
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
          child: ClipPath(
            clipper: _CustomButtonClipper(curveRadius: curveRadius),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: onTap,
                child: CustomPaint(
                  painter: _CustomButtonPainter._CustomBigButtonPainter(
                      curveRadius: curveRadius,
                      color: color,
                      borderColor: borderColor),
                  // child: Center(child: child),
                ),
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
                IgnorePointer(child: Icon(icon, size: 70, color: borderColor))),
      ],
    );
  }
}

class _CustomButtonPainter extends CustomPainter {
  final double curveRadius;
  final Color? color;
  final Color borderColor;
  final double borderWidth;

  _CustomButtonPainter._CustomBigButtonPainter({
    required this.curveRadius,
    required this.color,
    this.borderColor = Colors.white,
    this.borderWidth = 4.0,
  });

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
    _drawBorderShape(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(0 + curveRadius * 1.8, size.height);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

    //path.lineTo(size.width, 0);

    //path.close();

    canvas.drawPath(path, paint);
  }

  void _drawBorderShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    //path.moveTo(size.width, size.height);

    path.moveTo(0 + curveRadius * 1.8, size.height);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

    //path.lineTo(size.width, size.height);

    // path.lineTo(curveRadius * .1, size.height);

    // path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _CustomButtonClipper extends CustomClipper<Path> {
  final double curveRadius;

  _CustomButtonClipper({required this.curveRadius});

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(0 + curveRadius * 1.8, size.height);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
