import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/modules/welcome/language/language_controller.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
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
                        onPressed: () {
                          //TODO: Implement
                        },
                        child: SvgPicture.asset('assets/images/ic_filter.svg'),
                      ),
                    ],
                  ),
                  _pageView(_),
                  Spacer(),
                  _buttons(context)
                ],
              ),
            ),
          )),
    );
  }

  Column _buttons(BuildContext context) {
    return Column(
      children: [
        AppTexts.small(S.of(context).entranceMatchesFoundQuote('10,365', '24'),
            textAlign: TextAlign.center, color: AppColors.primary),
        CustomSpacer(),
        CustomButton(
          text: S.of(context).homePageBackToResults,
          expanded: true,
          onPressed: () {},
          suffixIcon: IconButtonParameters('ic_arrow_right', size: 18),
          radius: AppDimens.borderRadius,
          color: AppColors.yellow,
          textColor: AppColors.primary,
          bold: true,
          border: ButtonBorderParameters(isOutside: true, width: 4),
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
          height: Get.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _.pageController,
                  itemCount: 3, //TODO: Get the real number of pages
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/pigeon.png',
                            ),
                            CustomSpacer(multiplier: 3),
                            Padding(
                              padding: AppDimens.lateralPadding,
                              child: AppTexts.small(
                                S.of(context).entranceTitle,
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
                count: 3, //TODO: Get the real number of pages
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
