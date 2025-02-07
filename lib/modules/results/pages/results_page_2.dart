import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/global_widgets/custom_network_image.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/results/pages/results_page.dart';
import 'package:palumba_eu/modules/results/pages/results_shared/results_heart_stack.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';

class ResultsPage2 extends GetView<ResultsController> with ResultsPage {
  @override
  Widget build(BuildContext context) {
    bool isTablet = controller.isTablet;
    return Container(
      color: AppColors.background,
      child: Stack(children: [
        HeartStack(),
        SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(multiplier: 3),
              SizedBox(
                height: Get.width * (isTablet ? .62 : .82),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CustomNetworkImage(
                        width: Get.width * (isTablet ? .55 : .65),
                        height: Get.width * (isTablet ? .55 : .65),
                        isSvg: true,
                        imageUrl:
                            controller.maxPercentagePoliticParty?.party.logo ??
                                '',
                        radius: Get.width,
                        color: AppColors.blue,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: SvgPicture.asset(
                          'assets/images/img_heart_arrow.svg',
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ))
                  ],
                ),
              ),
              CustomSpacer(multiplier: 2),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.largeLateralPaddingValue),
                child: controller.maxPercentagePoliticParty == null
                    ? AppTexts.title('No results found',
                        color: AppColors.primary)
                    : RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTexts.customTextStyle(AppTextType.title,
                              black: true, color: AppColors.primary),
                          children: [
                            TextSpan(
                              text: ElectionManager.currentElection.value
                                  .resultsPage2_1Title(context),
                            ),
                            TextSpan(
                              text:
                                  ' ${controller.maxPercentagePoliticParty?.party.name ?? ''} ',
                              style:
                                  TextStyle(color: controller.getPartyColor()),
                            ),
                            TextSpan(
                              text: ElectionManager.currentElection.value
                                  .resultsPage2_2Title(context),
                            ),
                          ],
                        )),
              ),
              CustomSpacer(multiplier: 12),
            ],
          ),
        )
      ]),
    );
  }
}
