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
              'assets/images/ic_sticker_heart1_yellow.svg',
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 180),
            child: SvgPicture.asset(
              'assets/images/ic_sticker_heart2_yellow.svg',
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 180),
            child: SvgPicture.asset(
              'assets/images/ic_sticker_heart1_yellow.svg',
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: SvgPicture.asset(
              'assets/images/ic_sticker_heart2_yellow.svg',
            ),
          ),
        )
      ],
    );
  }
}

class MemesStack extends StatelessWidget {
  const MemesStack({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // get screen size

    return Stack(
      children: [
        Positioned(
          top: size.height * 0.15,
          right: 0,
          child: Image.asset(
            'assets/images/election/ny/img_memes_stack_1.png',
          ),
        ),
        Positioned(
          top: size.height * 0.22,
          left: 0,
          child: Image.asset(
            'assets/images/election/ny/img_memes_stack_2.png',
          ),
        ),
        Positioned(
          top: size.height * 0.4,
          right: 0,
          child: Image.asset('assets/images/election/ny/img_memes_stack_3.png'),
        ),
        Positioned(
          bottom: size.height * 0.35,
          left: 0,
          child: Image.asset('assets/images/election/ny/img_memes_stack_4.png'),
        ),
        Positioned(
          top: size.height * 0.75,
          right: 0,
          child: Image.asset('assets/images/election/ny/img_memes_stack_5.png'),
        ),
        Positioned(
          bottom: size.height * 0.03,
          left: 0,
          child: Image.asset('assets/images/election/ny/img_memes_stack_6.png'),
        ),
      ],
    );
  }
}

class TargetStack extends StatelessWidget {
  const TargetStack({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // get screen size

    return Stack(
      children: [
        Positioned(
          top: size.height * 0.11,
          right: 0,
          child: SvgPicture.asset(
            'assets/images/election/ny/ic_target_1.svg',
          ),
        ),
        Positioned(
          top: size.height * 0.38,
          left: 0,
          child: SvgPicture.asset(
            'assets/images/election/ny/ic_target_2.svg',
          ),
        ),
        Positioned(
          top: size.height * 0.5,
          right: 0,
          child: SvgPicture.asset(
            'assets/images/election/ny/ic_target_1.svg',
          ),
        ),
        Positioned(
          bottom: size.height * 0.15,
          left: 0,
          child: SvgPicture.asset(
            'assets/images/election/ny/ic_target_2.svg',
          ),
        ),
        Positioned(
          top: size.height * 0.76,
          right: 0,
          child: SvgPicture.asset(
            'assets/images/election/ny/ic_target_1.svg',
          ),
        ),
      ],
    );
  }
}

/*class MemesStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 125),
            child: Image.asset(
              'assets/images/election/ny/img_memes_stack_1.png',
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 180),
            child: Image.asset(
              'assets/images/election/ny/img_memes_stack_2.png',
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 300),
            child: Image.asset(
              'assets/images/election/ny/img_memes_stack_3.png',
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 300),
            child: Image.asset(
              'assets/images/election/ny/img_memes_stack_4.png',
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 550),
            child: Image.asset(
              'assets/images/election/ny/img_memes_stack_5.png',
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Image.asset(
              'assets/images/election/ny/img_memes_stack_6.png',
            ),
          ),
        )
      ],
    );
  }
}*/
