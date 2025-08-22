import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeartStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: SvgPicture.asset(
              'assets/images/ic_sticker_heart1.svg',
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 250),
            child: SvgPicture.asset(
              'assets/images/ic_sticker_heart2.svg',
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 275),
            child: SvgPicture.asset(
              'assets/images/ic_sticker_heart1.svg',
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(bottom: 75),
            child: SvgPicture.asset(
              'assets/images/ic_sticker_heart2.svg',
            ),
          ),
        )
      ],
    );
  }
}
