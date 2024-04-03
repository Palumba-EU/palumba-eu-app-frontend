import 'dart:math';

import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
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
            Transform.rotate(
              angle: -pi * .06,
              child: Container(
                height: 32,
                width: 40,
                margin:
                    EdgeInsets.only(top: DUI.spacing.smallPaddingValue * 1.5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius:
                      BorderRadius.circular(DUI.spacing.largeBorderRadius),
                ),
                child: Transform.rotate(
                  angle: pi * .06,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child:
                          SvgPicture.asset('assets/images/ic_arrow_back.svg')),
                ),
              ),
            ),
            DUI.text.title1(context, S.of(context).shortAppName,
                color: Theme.of(context).colorScheme.primary),
            Transform.rotate(
              angle: pi * .06,
              child: Container(
                margin:
                    EdgeInsets.only(top: DUI.spacing.smallPaddingValue * 1.5),
                height: 32,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius:
                      BorderRadius.circular(DUI.spacing.largeBorderRadius),
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
        DUI.spacing.spacer(),
        DUI.spacing.spacer(small: true),
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
    var curvePath = dashPath(path, dashArray: CircularIntervalList([6, 3]));
    canvas.drawPath(curvePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
