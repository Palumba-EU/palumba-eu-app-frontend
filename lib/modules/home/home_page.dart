import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:get/get.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeaders(context, _),
                  _buildBody(_),
                  _buildFooter(context, _)
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildHeaders(context, HomePageController _) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppDimens.lateralPaddingValue,
          top: AppDimens.lateralPaddingValue,
          bottom: AppDimens.lateralPaddingValue),
      child: Row(
        children: [
          AppTexts.title(S.of(context).shortAppName,
              color: AppColors.primary, fontSize: 27.5),
          Spacer(),
          TextButton(
            onPressed: _.launchFaqUrl,
            child: AppTexts.regular(S.of(context).faq,
                bold: true, color: AppColors.primary),
          ),
          TextButton(
            onPressed: _.goToSettings,
            child: SvgPicture.asset('assets/images/ic_filter.svg'),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(HomePageController _) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSpacer(
            multiplier: 4,
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _.pageController,
              itemCount: 3,
              itemBuilder: (context, index) => Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: AppDimens.lateralPadding,
                        child: SvgPicture.asset(
                          'assets/images/${index == 0 ? 'img_pigeon' : index == 1 ? 'img_swipe' : 'img_results'}.svg',
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(multiplier: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.extraLargeLateralPaddingValue),
                    child: AppTexts.small(
                      index == 0
                          ? S.of(context).entranceTitle1
                          : index == 1
                              ? S.of(context).entranceTitle2
                              : S.of(context).entranceTitle3,
                      textAlign: TextAlign.center,
                      bold: true,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomSpacer(
            multiplier: 3,
          ),
          SmoothPageIndicator(
            controller: _.pageController,
            count: 3,
            effect: WormEffect(
              dotWidth: 8,
              dotHeight: 8,
              spacing: 4,
              activeDotColor: AppColors.primary,
              dotColor: AppColors.lightPrimary,
            ),
          ),
          CustomSpacer(
            multiplier: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, HomePageController _) {
    return Padding(
      padding: AppDimens.lateralPadding,
      child: Column(
        children: [
          //TODO: Get the real number of matches from api
          AppTexts.small(S.of(context).homePageMatchesFoundQuote('X'),
              textAlign: TextAlign.center, color: AppColors.primary),
          CustomSpacer(
            multiplier: 2,
          ),
          GetBuilder<HomePageController>(
            id: _.resultsExistsKey,
            builder: (controller) => _.resultsData.isEmpty && !_.isTestRunning
                ? SizedBox.shrink()
                : CustomButton(
                    text: _.isTestRunning
                        ? S.of(context).homePageBackToTest
                        : S.of(context).homePageMyResults,
                    expanded: true,
                    onPressed: () {
                      _.backToResultsOrTest();
                    },
                    suffixIcon:
                        IconButtonParameters('ic_arrow_right', size: 18),
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
            onPressed: _.startNewTest,
            suffixIcon: IconButtonParameters('ic_arrow_right',
                size: 18, color: AppColors.text),
            radius: AppDimens.borderRadius,
            color: AppColors.primary,
            textColor: AppColors.text,
            bold: true,
            border: ButtonBorderParameters(
                isOutside: true, width: 4, color: AppColors.lightPrimary),
          ),
          CustomSpacer(multiplier: 2),
        ],
      ),
    );
  }
}
