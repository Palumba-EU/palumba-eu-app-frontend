import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/components/custom_mds_graphic/custom_mds_graphic.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';

class ResultsPage4 extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacer(multiplier: 3),
        Obx(
          () => IgnorePointer(
            child: CustomMDSGraphic(
              height: Get.height * .6,
              width: Get.width * .9,
              // ignore: invalid_use_of_protected_member
              scatterSpots: controller.scatterSpots.value,
            ),
          ),
        ),
      ],
    );
  }
}
