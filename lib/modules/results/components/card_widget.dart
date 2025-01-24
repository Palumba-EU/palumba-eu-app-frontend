import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/statement_response.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/global_widgets/emoji_label_container.dart';
import 'package:palumba_eu/modules/results/helpers/results_helper.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.data,
    super.key,
  });

  final CardStatementData data;

  @override
  Widget build(BuildContext context) {
    var color = AppColors.green;
    var colorBorder = AppColors.lightGreen;
    var icon = 'ic_check';
    if (data.answer.answer == StatementResponse.stronglyDisagree) {
      color = AppColors.yellow;
      colorBorder = AppColors.lightYellow;
      icon = 'ic_cross';
    }

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
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSpacer(
                  multiplier: 2,
                ),
                Padding(
                  padding: AppDimens.lateralPadding,
                  child: EmojiLabelContainer(
                    emoji: data.statement.emojis,
                    backgroundColor: Colors.white,
                  ),
                ),
                CustomSpacer(
                  multiplier: 2,
                ),
                CustomSpacer(small: true),
                Flexible(
                    child: Padding(
                  padding: AppDimens.lateralPadding,
                  child: AutoSizeText(
                    data.statement.statement,
                    style: AppTexts.customTextStyle(
                      AppTextType.title,
                      fontSize: 24,
                      black: true,
                      color: Colors.white,
                    ),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 15 +
                      (35 + 20 + 5 + 20 + AppDimens.smallLateralPaddingValue),
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
                            left: 35,
                            right: AppDimens.smallLateralPaddingValue),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: Get.height * 0.075,
                            ),
                            Expanded(
                                child: SvgPicture.asset(
                              'assets/images/$icon.svg',
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                color,
                                BlendMode.srcIn,
                              ),
                            )),
                            CustomSpacer(),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: List.generate(
                                  data.parties.length,
                                  (index) => CustomNetworkImage(
                                        width: 20,
                                        height: 20,
                                        isSvg: true,
                                        imageUrl:
                                            data.parties[index].logo ?? '',
                                        radius: Get.width,
                                        color: AppColors.blue,
                                      )),
                            ),
                            CustomSpacer(),
                          ],
                        ),
                      ),
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
