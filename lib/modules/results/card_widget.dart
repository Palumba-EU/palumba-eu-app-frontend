import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

import '../../global_widgets/custom_network_image.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.card,
    required this.color,
    required this.colorBorder,
    super.key,
  });

  final CardStatementData card;
  final Color color;
  final Color colorBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: colorBorder,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(AppDimens.largeBorderRadius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                card.statement.emojis != null
                    ? Padding(
                        padding: AppDimens.lateralPadding,
                        child: EmojiLabelContainer(
                          emoji: card.statement.emojis!,
                          backgroundColor: Colors.white,
                        ),
                      )
                    : const SizedBox.shrink(),
                CustomSpacer(
                  multiplier: 2,
                ),
                CustomSpacer(small: true),
                Padding(
                  padding: AppDimens.lateralPadding,
                  child: AppTexts.title(
                    card.statement.statement ?? '',
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: Get.width * .25,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Transform.flip(
                        flipX: false,
                        child: ClipPath(
                          clipper: _CustomButtonClipper(curveRadius: 15),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: CustomPaint(
                              painter:
                                  _CustomButtonPainter._CustomBigButtonPainter(
                                      curveRadius: 15,
                                      color: Colors.white,
                                      borderColor: Colors.white),
                              // child: Center(child: child),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 40,
                            right: AppDimens.smallLateralPaddingValue),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomSpacer(
                              multiplier: 5,
                            ),
                            SvgPicture.asset(
                              'assets/images/ic_check.svg',
                              colorFilter: ColorFilter.mode(
                                color,
                                BlendMode.srcIn,
                              ),
                            ),
                            CustomSpacer(),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: List.generate(
                                  card.parties.length,
                                  (index) => CustomNetworkImage(
                                        width: 20,
                                        height: 20,
                                        isSvg: true,
                                        imageUrl: card.parties[index].logo ?? '',
                                        radius: Get.width,
                                        color: AppColors.blue,
                                      )),
                            ),
                            CustomSpacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
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
    this.borderWidth = 8.0,
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
    paint.strokeWidth = borderWidth;
    _drawBorderShape(canvas, size, paint);
  }

  void _drawShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(0 + curveRadius * 1.8, size.height);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

    canvas.drawPath(path, paint);
  }

  void _drawBorderShape(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    path.moveTo(0 + curveRadius * 1.8, size.height);

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

    path.lineTo(0 + curveRadius * 1.8, size.height);

    path.quadraticBezierTo(-curveRadius * 1.2, curveRadius * 3, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
