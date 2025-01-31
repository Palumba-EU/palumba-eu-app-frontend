import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class SvgHelper {
  static Future<ui.Image> loadSvgFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    final String rawSvg = response.body.toString();

    return imageFromLoader(SvgStringLoader(rawSvg));
  }

  static Future<ui.Image> loadSvgFromAssets(String assetName) async {
    return imageFromLoader(SvgAssetLoader('assets/images/${assetName}.svg'));
  }

  static Future<ui.Image> imageFromLoader(BytesLoader loader) async {
    final pictureInfo = await vg.loadPicture(loader, null);
    final ui.Image image = await pictureInfo.picture.toImage(
        pictureInfo.size.width.round(), pictureInfo.size.height.round());

    pictureInfo.picture.dispose();

    return image;
  }
}
