import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:path_drawing/path_drawing.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacer(multiplier: 2),
        SizedBox(
          width: double.infinity,
          child: CustomPaint(painter: _CustomHeaderPainter()),
        ),
        CustomSpacer(),
        Padding(
          padding: AppDimens.lateralPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.rotate(
                angle: -pi * .06,
                child: Container(
                  height: 32,
                  width: 40,
                  margin: EdgeInsets.only(
                      top: AppDimens.smallLateralPaddingValue * 1.5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.3),
                    borderRadius:
                        BorderRadius.circular(AppDimens.largeBorderRadius),
                  ),
                  child: Transform.rotate(
                    angle: pi * .06,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                            'assets/images/ic_arrow_back.svg')),
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 143,
                fit: BoxFit.fitWidth,
              ),
              Transform.rotate(
                angle: pi * .06,
                child: Container(
                  margin: EdgeInsets.only(
                      top: AppDimens.smallLateralPaddingValue * 1.5),
                  height: 32,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.3),
                    borderRadius:
                        BorderRadius.circular(AppDimens.largeBorderRadius),
                  ),
                  child: Transform.rotate(
                    angle: pi * -.06,
                    child: Padding(
                        padding: EdgeInsets.all(6),
                        child: SvgPicture.asset('assets/images/ic_home.svg')),
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomSpacer(),
        CustomSpacer(small: true),
        SizedBox(
          width: double.infinity,
          child: CustomPaint(painter: _CustomHeaderPainter()),
        ),
        CustomSpacer(multiplier: 2),
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
    var curvePath = dashPath(path, dashArray: CircularIntervalList([6, 3]));
    canvas.drawPath(curvePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
