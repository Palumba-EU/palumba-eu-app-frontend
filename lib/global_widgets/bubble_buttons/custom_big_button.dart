import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class CustomBigButtonCurve extends StatelessWidget {
  const CustomBigButtonCurve({
    Key? key,
    required this.icon,
    this.curveRadius = 25,
    required this.isSelected,
    required this.onTap,
    this.flip = false,
    this.onLongPress,
    this.onLongPressEnd,
  }) : super(key: key);
  final String icon;
  final double curveRadius;
  final bool isSelected;
  final bool flip;
  final Function() onTap;
  final Function()? onLongPress;
  final Function(LongPressEndDetails)? onLongPressEnd;

  @override
  Widget build(BuildContext context) {
    final color = flip ? AppColors.yellow : AppColors.green;
    final borderColor = AppColors.background;
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
                onLongPress: onLongPress,
                onLongPressEnd: onLongPressEnd,
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
            top: AppDimens.largeLateralPaddingValue * 2,
            bottom: 0,
            right: flip ? Get.width * .1 : 0,
            left: flip ? 0 : Get.width * .1,
            child: IgnorePointer(
              child: Center(
                  child: SvgPicture.asset(
                'assets/images/$icon.svg',
                height: 55,
                fit: BoxFit.fitHeight,
              )),
            )),
      ],
    );
  }
}

class _CustomButtonPainter extends CustomPainter {
  final double curveRadius;
  final Color? color;
  final Color borderColor;

  _CustomButtonPainter._CustomBigButtonPainter({
    required this.curveRadius,
    required this.color,
    this.borderColor = Colors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    size = Size(size.width, size.height);

    // Draw filled shape
    paint.color = color ?? Colors.white;
    paint.style = PaintingStyle.fill;
    _drawShape(canvas, size, paint);

    // Draw border
    paint.color = borderColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 8.0;
    _drawBorderShape(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(0 + curveRadius * 1.8, size.height + 2);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

    canvas.drawPath(path, paint);
  }

  void _drawBorderShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(0 + curveRadius * 1.8, size.height + 2);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

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

    path.lineTo(0 + curveRadius * 1.8, size.height + 2);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
