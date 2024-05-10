import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class TopicIndicatorWidget extends StatelessWidget {
  const TopicIndicatorWidget({
    required this.title,
    required this.color,
    required this.position,
    required this.party1,
    required this.party2,
    super.key,
  });

  final String title;
  final Color color;
  final double position;
  final PoliticParty? party1;
  final PoliticParty? party2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width * 0.63,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: SvgPicture.asset(
                  'assets/images/img_hemicycle_graph.svg',
                  height: Get.height * 0.13,
                  width: Get.width * .6,
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
              Transform.translate(
                  offset: Offset(-1.5, 15),
                  child: Transform.rotate(
                      angle: position * pi,
                      child: SvgPicture.asset(
                          height: 80, 'assets/images/img_needle.svg'),
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomNetworkImage(
                    border: Border.all(color: AppColors.background, width: 3),
                    width: 45,
                    height: 45,
                    isSvg: true,
                    imageUrl: party1?.logo ?? '',
                    radius: Get.width,
                    color: AppColors.blue,
                  ),
                  CustomNetworkImage(
                    border: Border.all(color: AppColors.background, width: 3),
                    width: 45,
                    height: 45,
                    isSvg: true,
                    imageUrl: party2?.logo ?? '',
                    radius: Get.width,
                    color: AppColors.blue,
                  )
                ],
              )
            ],
          ),
        ),
        // CustomSpacer(),
        AppTexts.medium(title, color: color, black: true)
      ],
    );
  }
}
