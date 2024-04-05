import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
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
      throw ArgumentError('maxValue should be bnigger then 0.');
    }
    double percentage = value / maxValue;

    // Make sure value is in range [0, 1]
    if (percentage < 0) {
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

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
        future: loadImage(widget.imageUrl),
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
                  color: AppColors.text,
                  image: snapshot.data!,
                ),
              ),
            );
          } else {
            return SizedBox.expand();
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
      ..style = PaintingStyle.stroke;

    final path = Path();
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: arcDiameter,
      height: arcDiameter,
    );
    path.arcTo(rect, pi / 2, pi * animation.value, false);
    canvas.drawPath(path, paint);

    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final circleStroke = Paint()
      ..color = AppColors.whiteButton
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    final circleRadius = 15.0;
    final offset = Offset(
      rect.center.dx + cos(pi * animation.value + pi / 2) * rect.width / 2,
      rect.center.dy + sin(pi * animation.value + pi / 2) * rect.height / 2,
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