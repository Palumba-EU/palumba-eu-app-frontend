import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Stickers extends StatelessWidget {
  const Stickers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/ic_sticker_ballot_box.svg',
              ),
              Spacer(),
              SvgPicture.asset(
                'assets/images/ic_sticker_heart.svg',
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/ic_sticker_target.svg',
              ),
            ],
          ),
          Row(
            children: [
              Spacer(),
              SvgPicture.asset(
                'assets/images/ic_sticker_sign.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
