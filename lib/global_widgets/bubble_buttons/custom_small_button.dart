import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class CustomSmallButtonCurve extends StatelessWidget {
  const CustomSmallButtonCurve({
    Key? key,
    required this.isSelected,
    this.curveRadius = 200,
    required this.icon,
    required this.onTap,
    this.flip = false,
    this.onLongPressEnd,
    this.onLongPress,
  }) : super(key: key);

  final bool isSelected;
  final double curveRadius;
  final String? icon;
  final bool flip;
  final Function() onTap;
  final Function()? onLongPress;
  final Function(LongPressEndDetails)? onLongPressEnd;

  @override
  Widget build(BuildContext context) {
    final color = flip ? AppColors.lightGreen : AppColors.lightYellow;
    final borderColor = AppColors.background;
    return Stack(
      children: [
        Transform.flip(
          flipX: flip,
          child: Container(
            margin: EdgeInsets.only(top: AppDimens.largeLateralPaddingValue),
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onTap: onTap,
              onLongPress: onLongPress,
              onLongPressEnd: onLongPressEnd,
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
            top: AppDimens.largeLateralPaddingValue * 2,
            bottom: 0,
            right: flip ? Get.width * .1 : 0,
            left: flip ? 0 : Get.width * .1,
            child: IgnorePointer(
    child:
            Center(
                child: SvgPicture.asset(
              'assets/images/$icon.svg',
              height: 20,
              fit: BoxFit.fitHeight,
            )))),
      ],
    );
  }
}

class _CustomSmallButtonPainter extends CustomPainter {
  final double curveRadius;
  final Color? color;
  final Color borderColor;

  _CustomSmallButtonPainter._CustomBigButtonPainter({
    required this.curveRadius,
    required this.color,
    this.borderColor = Colors.white,
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
    paint.strokeWidth = 4.0;
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
    path.lineTo(size.width, size.height);
    //path.lineTo(0, size.height);
    //path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomSmallButtonSelectedCurve extends StatelessWidget {
  const CustomSmallButtonSelectedCurve(
      {Key? key,
      required this.isSelected,
      this.curveRadius = 200,
      required this.icon,
      required this.onTap,
      this.flip = false})
      : super(key: key);

  final bool isSelected;
  final double curveRadius;
  final String? icon;
  final bool flip;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final color = flip ? AppColors.lightGreen : AppColors.lightYellow;
    final borderColor = AppColors.background;
    return Stack(
      children: [
        Transform.flip(
          flipX: flip,
          child: Container(
            margin: EdgeInsets.only(top: AppDimens.largeLateralPaddingValue),
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onTap: onTap,
              child: CustomPaint(
                painter: _CustomSmallButtonSelectedPainter
                    ._CustomSmallSelectedButtonPainter(
                        curveRadius: curveRadius,
                        color: color,
                        borderColor: borderColor),
              ),
            ),
          ),
        ),
        Positioned(
            top: AppDimens.largeLateralPaddingValue * 2,
            bottom: 0,
            right: flip ? Get.width * .1 : 0,
            left: flip ? 0 : Get.width * .1,
            child: Center(
                child: SvgPicture.asset(
              'assets/images/$icon.svg',
              width: 20,
            ))),
      ],
    );
  }
}

class _CustomSmallButtonSelectedPainter extends CustomPainter {
  final double curveRadius;
  final Color? color;
  final Color borderColor;

  _CustomSmallButtonSelectedPainter._CustomSmallSelectedButtonPainter({
    required this.curveRadius,
    required this.color,
    this.borderColor = Colors.white,
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
    paint.strokeWidth = 4.0;
    _drawShapeBorder(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * .84, 0, size.width, size.height);

    path.lineTo(size.width, curveRadius);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  void _drawShapeBorder(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * .84, 0, size.width, size.height);

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
