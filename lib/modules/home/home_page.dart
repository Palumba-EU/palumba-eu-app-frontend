import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/statments/statements_screen_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GetBuilder<HomePageController>(
        builder: (_) => Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.lateralPaddingValue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        AppTexts.title(
                          S.of(context).shortAppName,
                          color: AppColors.primary,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            //TODO: Implement
                          },
                          child: AppTexts.regular('FAQ',
                              bold: true, color: AppColors.primary),
                        ),
                        TextButton(
                          onPressed: _.goToSettings,
                          child:
                              SvgPicture.asset('assets/images/ic_filter.svg'),
                        ),
                      ],
                    ),
                    _pageView(_),
                    Spacer(),
                    _buttons(context, _)
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Column _buttons(BuildContext context, HomePageController _) {
    return Column(
      children: [
        //TODO: Get the real number of matches from api
        AppTexts.small(S.of(context).homePageMatchesFoundQuote('X'),
            textAlign: TextAlign.center, color: AppColors.primary),
        CustomSpacer(),
        GetBuilder<HomePageController>(
          id: _.resultsExistsKey,
          builder: (controller) => _.resultsData.isEmpty
              ? SizedBox.shrink()
              : CustomButton(
                  text: S.of(context).homePageBackToResults,
                  expanded: true,
                  onPressed: () {
                    _.backToresults();
                  },
                  suffixIcon: IconButtonParameters('ic_arrow_right', size: 18),
                  radius: AppDimens.borderRadius,
                  color: AppColors.yellow,
                  textColor: AppColors.primary,
                  bold: true,
                  border: ButtonBorderParameters(isOutside: true, width: 4),
                ),
        ),
        CustomSpacer(multiplier: 2),
        CustomButton(
          text: S.of(context).homePageStartButton,
          expanded: true,
          onPressed: () {
            Get.offAllNamed(LanguageController.route);
          },
          suffixIcon: IconButtonParameters('ic_arrow_right',
              size: 18, color: AppColors.text),
          radius: AppDimens.borderRadius,
          color: AppColors.primary,
          textColor: AppColors.text,
          bold: true,
          border: ButtonBorderParameters(
              isOutside: true, width: 4, color: AppColors.lightPrimary),
        )
      ],
    );
  }

  Column _pageView(HomePageController _) {
    return Column(
      children: [
        SizedBox(
          height: Get.height < 750 ? Get.height * 0.5 : Get.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _.pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              'assets/images/img_pigeon.svg',
                              height: Get.height * .35,
                            ),
                            CustomSpacer(multiplier: 3),
                            Padding(
                              padding: AppDimens.lateralPadding,
                              child: AppTexts.small(
                                S.of(context).homePageText,
                                textAlign: TextAlign.center,
                                bold: true,
                                color: AppColors.primary,
                              ),
                            ),
                            CustomSpacer(multiplier: 3)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _.pageController,
                count: 3,
                effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.lightPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
