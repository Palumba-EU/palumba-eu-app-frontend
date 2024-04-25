import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class CustomContainerCurve extends StatelessWidget {
  const CustomContainerCurve(
      {Key? key, this.child, this.height, this.curveRadius = 200, this.color})
      : super(key: key);
  final Widget? child;
  final double? height;
  final double curveRadius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      child: CustomPaint(
        painter:
            _CustomContainerPainter(curveRadius: curveRadius, color: color),
        child: Padding(
          padding: EdgeInsets.only(bottom: AppDimens.lateralPaddingValue * 3),
          child: child,
        ),
      ),
    );
  }
}

class _CustomContainerPainter extends CustomPainter {
  final double curveRadius;
  final Color? color;

  _CustomContainerPainter({required this.curveRadius, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Properties
    paint.color = color ?? Theme.of(Get.context!).colorScheme.background;
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(0, size.height - curveRadius * .8);
    path.quadraticBezierTo(size.width * .5, size.height + curveRadius * .2,
        size.width, size.height - curveRadius * .8);
    path.lineTo(size.width, 0);
    //path.moveTo(0, y)

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomContainerClipper extends CustomClipper<Path> {
  final double curveRadius;

  CustomContainerClipper({required this.curveRadius});

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - curveRadius * .8);
    path.quadraticBezierTo(size.width * .5, size.height + curveRadius * .2,
        size.width, size.height - curveRadius * .8);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
