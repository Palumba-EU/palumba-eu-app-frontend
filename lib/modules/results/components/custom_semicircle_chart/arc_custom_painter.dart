import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class ArcLine extends StatefulWidget {
  const ArcLine({
    super.key,
    required this.arcDiameter,
    this.lineWidth = 10.0,
    required this.maxValue,
    required this.value,
    this.text = '',
    this.percentage = '',
    required this.index,
    this.imageUrl = '',
  });
  final double arcDiameter;
  final double lineWidth;
  final double maxValue;
  final double value;
  final String text;
  final String percentage;
  final int index;
  final String imageUrl;

  @override
  State<ArcLine> createState() => _ArcLineState();
}

class _ArcLineState extends State<ArcLine> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isAnimationCompleted = false;

  double calculatePercentage(double value, double maxValue) {
    if (maxValue <= 0) {
      throw ArgumentError('maxValue should be bigger then 0.');
    }
    double percentage = value / maxValue;

    // Make sure value is in range [0, 1]
    if (percentage < 0.0) {
      return 0.0;
    } else if (percentage > 1) {
      return 1.0;
    } else {
      return percentage;
    }
  }

  Future<ui.Image> loadImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = Uint8List.fromList(response.bodyBytes);
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();

    return frame.image;
  }

  Future<ui.Image> loadSvg(String url) async {
    final response = await http.get(Uri.parse(url));
    final String rawSvg = response.body.toString();

    final pictureInfo = await vg.loadPicture(SvgStringLoader(rawSvg), null);
    final ui.Image image = await pictureInfo.picture.toImage(pictureInfo.size.width.round(), pictureInfo.size.height.round());

    pictureInfo.picture.dispose();

    return image;
  }

  void _initAnimation() {
    final animationStopValue =
        calculatePercentage(widget.value, widget.maxValue);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      value: 0.0,
    )..animateTo(animationStopValue);
    _isAnimationCompleted = true;
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
        future: loadSvg(widget.imageUrl), //loadImage(widget.imageUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (!_isAnimationCompleted) {
              _initAnimation();
            }
            return Align(
              alignment: Alignment.center,
              child: CustomPaint(
                painter: ArcPainter(
                  animation: _controller,
                  arcDiameter: widget.arcDiameter,
                  lineWidth: widget.lineWidth,
                  color: AppColors.primary,
                  image: snapshot.data!,
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        });
  }
}

class ArcPainter extends CustomPainter {
  ArcPainter({
    required this.animation,
    required this.arcDiameter,
    required this.lineWidth,
    required this.color,
    required this.image,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final double arcDiameter;
  final double lineWidth;
  final Color color;
  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: arcDiameter,
      height: arcDiameter * 1.08,
    );
    path.arcTo(rect, pi / 4, pi * animation.value + pi / 4, false);
    canvas.drawPath(path, paint);

    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final circleStroke = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    final circleRadius = 15.0;
    final adjustedWidth = (rect.width / 2);
    final adjustedHeight = (rect.height / 2);
    final offset = Offset(
      (rect.center.dx + cos(pi * animation.value + pi / 2) * adjustedWidth),
      (rect.center.dy + sin(pi * animation.value + pi / 2) * adjustedHeight),
    );
    final circleRect = Rect.fromCircle(center: offset, radius: 15);
    final imageRect =
        Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble());
    canvas.drawCircle(offset, circleRadius, circlePaint);
    canvas.drawCircle(offset, circleRadius, circleStroke);
    final clipPath = Path();
    clipPath.addOval(circleRect);
    canvas.save();
    canvas.clipPath(clipPath);
    canvas.drawImageRect(image, imageRect, circleRect, Paint());

    canvas.restore();
  }

  @override
  bool shouldRepaint(ArcPainter oldDelegate) {
    return oldDelegate.animation.value != animation.value ||
        oldDelegate.arcDiameter != arcDiameter;
  }
}
