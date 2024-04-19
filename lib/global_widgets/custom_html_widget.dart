import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:palumba_eu/utils/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomHtmlWidget extends StatelessWidget {
  final String content;
  final TextStyle? textStyle;

  const CustomHtmlWidget({
    Key? key,
    required this.content,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      content,
      textStyle: textStyle,
      onTapUrl: (url) => Utils.launch(
        url.replaceAll('"', '').trim(),
        LaunchMode.externalApplication,
      ),
    );
  }
}
