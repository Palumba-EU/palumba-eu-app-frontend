import 'dart:ui' as ui;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class MyScatterChart extends StatelessWidget {
  final List<ScatterSpot> scatterSpots;

  const MyScatterChart({super.key, this.scatterSpots = const []});
  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        minX: -1,
        maxX: 1,
        minY: -1,
        maxY: 1,
        backgroundColor: Colors.transparent,
        gridData: FlGridData(
          show: false,
        ),
        clipData:
            FlClipData(bottom: false, left: false, right: false, top: false),
        titlesData: FlTitlesData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        scatterSpots: scatterSpots,
        scatterLabelSettings: ScatterLabelSettings(
          showLabel: false,
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}

//CUSTOM CLASS TO ADD IMAGES TO SCATTER POINTS

/// This class is an implementation of a [FlDotPainter] that draws
/// a circled shape with an image inside.
class FlDotCirclePainterCustom extends FlDotPainter {
  /// The color of the circle is determined determined by [color],
  /// [radius] determines the radius of the circle.
  /// You can have a stroke line around the circle,
  /// by setting the thickness with [strokeWidth],
  /// and you can change the color of of the stroke with [strokeColor].
  FlDotCirclePainterCustom({
    this.color = Colors.green,
    double? radius,
    this.strokeColor = const Color.fromRGBO(76, 175, 80, 1),
    this.strokeWidth = 0.0,
    this.image,
    this.imageRounded = true,
  }) : radius = radius ?? 4.0;

  /// The fill color to use for the circle
  Color color;

  /// Customizes the radius of the circle
  double radius;

  /// The stroke color to use for the circle
  Color strokeColor;

  /// The stroke width to use for the circle
  double strokeWidth;

  /// The image to use for the circle
  ui.Image? image;

  bool imageRounded;

  /// Implementation of the parent class to draw the circle
  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    if (strokeWidth != 0.0 && strokeColor.opacity != 0.0) {
      canvas.drawCircle(
        offsetInCanvas,
        radius + (strokeWidth / 2),
        Paint()
          ..color = strokeColor
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
      );
    }
    if (image != null) {
      final paint = Paint();

      final rect = Rect.fromCircle(center: offsetInCanvas, radius: radius);
      final imageRect = Rect.fromLTRB(
          0, 0, image!.width.toDouble(), image!.height.toDouble());
      final clipOval = Path()..addOval(rect);
      canvas.save();
      if (imageRounded) {
        canvas.clipPath(clipOval);
        canvas.drawImageRect(image!, imageRect, rect, paint);
      } else {
        final correctionOffset = ui.Offset(-20, -20);
        canvas.drawImageRect(image!, imageRect, rect, paint);
        // Add text below the image
        final paragraphStyle = ui.ParagraphStyle(
          textDirection: TextDirection.ltr,
        );
        final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(ui.TextStyle(
              color: AppColors.lightBlue, fontWeight: FontWeight.w900))
          ..addText(S.of(Get.context!).resultsPage4TitleUserHere);
        final constraints = ui.ParagraphConstraints(width: 300);
        final paragraph = paragraphBuilder.build();
        paragraph.layout(constraints);
        final offset =
            Offset(offsetInCanvas.dx - 10, offsetInCanvas.dy + radius + 30);
        canvas.drawParagraph(paragraph, offset + correctionOffset);
      }

      canvas.restore();
    } else {
      //If image is not avaliable draw a circle
      canvas.drawCircle(
        offsetInCanvas,
        radius,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill,
      );
    }
  }

  /// Implementation of the parent class to get the size of the circle
  @override
  Size getSize(FlSpot spot) {
    return Size(radius * 2, radius * 2);
  }

  @override
  Color get mainColor => color;

  FlDotCirclePainter _lerp(
    FlDotCirclePainter a,
    FlDotCirclePainter b,
    double t,
  ) {
    return FlDotCirclePainter(
      color: Color.lerp(a.color, b.color, t)!,
      radius: ui.lerpDouble(a.radius, b.radius, t),
      strokeColor: Color.lerp(a.strokeColor, b.strokeColor, t)!,
      strokeWidth: ui.lerpDouble(a.strokeWidth, b.strokeWidth, t)!,
    );
  }

  @override
  FlDotPainter lerp(FlDotPainter a, FlDotPainter b, double t) {
    if (a is! FlDotCirclePainter || b is! FlDotCirclePainter) {
      return b;
    }
    return _lerp(a, b, t);
  }

  @override
  bool hitTest(
    FlSpot spot,
    Offset touched,
    Offset center,
    double extraThreshold,
  ) {
    final distance = (touched - center).distance.abs();
    return distance < radius + extraThreshold;
  }

  /// Used for equality check, see [EquatableMixin].
  @override
  List<Object?> get props => [
        color,
        radius,
        strokeColor,
        strokeWidth,
      ];
}
