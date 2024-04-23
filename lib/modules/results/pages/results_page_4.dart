import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/custom_mds_graphic.dart';

import '../results_controller.dart';

class ResultsPage4 extends GetView<ResultsController> {
  const ResultsPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomSpacer(multiplier: 3),
          //TODO: add mds graphic
          IgnorePointer(
            child: CustomMDSGraphic(
              height: Get.height * .6,
              width: Get.width * .9,
              scatterSpots: controller.scatterSpots,
            ),
          ),
          CustomSpacer(
            multiplier: 12,
          ),
        ],
      ),
    );
  }
}
