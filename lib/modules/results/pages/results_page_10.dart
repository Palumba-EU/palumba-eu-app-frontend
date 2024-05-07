import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:palumba_eu/modules/results/results_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:palumba_eu/utils/string_utils.dart';

class ResultsPage10 extends GetView<ResultsController> {
  const ResultsPage10({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: SizedBox(
              width: Get.width,
              height: Get.height * .5,
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset('assets/images/img_ballot_box_big.png'))),
        ),
        Get.height < 850
            ? Container(
                color: AppColors.background.withOpacity(.7),
                child: IntrinsicHeight(child: _body(context)))
            : _body(context),
      ],
    );
  }

  Column _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSpacer(multiplier: 3),
        SvgPicture.asset('assets/images/ic_europe_vote_logos.svg'),
        CustomSpacer(multiplier: 2),
        Padding(
            padding: AppDimens.lateralPadding,
            child: AppTexts.title(S.of(context).resultsPage10Title,
                color: AppColors.primary, textAlign: TextAlign.center)),
        CustomSpacer(multiplier: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.offAllNamed(HomePageController.route,
                    arguments: {StringUtils.fromResultsKey: true});
              },
              child: AppTexts.regular(S.of(context).resultsPage10NopButton,
                  bold: true, color: AppColors.primary),
            ),
            CustomHorizontalSpacer(),
            CustomButton(
              onPressed: controller.launchUrl,
              text: S.of(context).resultsPage10YesButton,
              //Default parameters
              border: ButtonBorderParameters(),
            ),
          ],
        ),
        CustomSpacer(multiplier: 2),
      ],
    );
  }
}