import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:palumba_eu/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomHtmlWidget extends StatelessWidget {
  final String content;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  const CustomHtmlWidget({
    Key? key,
    required this.content,
    this.textStyle,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Style style = Style(
        color: textStyle?.color ?? AppColors.primary,
        fontFamily: textStyle?.fontFamily,
        fontSize: FontSize(textStyle?.fontSize ?? AppDimens.fontSizeRegular),
        fontWeight: textStyle?.fontWeight,
        textDecoration: TextDecoration.none,
        textDecorationColor: AppColors.lightPrimary,
        textDecorationThickness: 2);
    return Html(
      data: content,
      style: {
        'html': Style(textAlign: textAlign),
        'body': Style(padding: HtmlPaddings.zero, margin: Margins.zero),
        'p': style,
        'a': style.copyWith(
          color: AppColors.lightPrimary,
        ),
      },
      onLinkTap: (url, _, __) => Utils.launch(
        url!.replaceAll('"', '').trim(),
        LaunchMode.externalApplication,
      ),
      shrinkWrap: true,
    );
    /*
    return HtmlWidget(
      content,
      textStyle: textStyle,
      customStylesBuilder: (element) {
        if (element.classes.contains('span')) {
          return {'color': 'red'};
        }

        return null;
      },
      onTapUrl: (url) => Utils.launch(
        url.replaceAll('"', '').trim(),
        LaunchMode.externalApplication,
      ),
    );
    */
  }
}
