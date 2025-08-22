import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';
import 'package:palumba_eu/global_widgets/custom_html_widget.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/home/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
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
                  CustomSpacer(),
                  Obx(
                    () => _.showBanner
                        ? _buildBodyBanner(context, _)
                        : _buildBodyPageView(_),
                  ),
                  CustomSpacer(
                    multiplier: 5,
                  ),
                  _buildFooter(context, _)
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildBodyBanner(BuildContext context, HomePageController _) {
    final youthCardSponsor = _.getYouthCardSponsor();
    return Expanded(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppDimens.bigLateralPaddingValue),
        width: double.infinity,
        color: AppColors.extraLightYellow,
        child: DottedBorder(
          color: AppColors.lightYellow,
          strokeWidth: 3,
          dashPattern: [
            5,
            5,
          ],
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDimens.bigLateralPaddingValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                    border: Border.all(
                        color: AppColors.lightYellow, width: 2, strokeAlign: 1),
                  ),
                  child: Image.network(
                    youthCardSponsor.bannerImage ?? '',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                CustomSpacer(
                  multiplier: 2,
                ),
                CustomHtmlWidget(
                  content: youthCardSponsor.bannerDescription ?? '',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      fontSize: AppDimens.fontSizeSmall,
                      fontWeight: FontWeight.w100),
                ),
                CustomSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _.eggPressed,
                      child: AppTexts.small(
                          ElectionManager.currentElection.value
                              .resultsPage10NopButton(context),
                          bold: true,
                          color: AppColors.primary),
                    ),
                    CustomHorizontalSpacer(),
                    CustomButton(
                      onPressed: () =>
                          _.launchUrl(youthCardSponsor.bannerLink ?? ''),
                      text: ElectionManager.currentElection.value
                          .resultsPage10YesButton(context),
                      textFontSize: AppDimens.fontSizeSmall,
                      bold: true,
                      padding: EdgeInsets.all(12),
                      //Default parameters
                      border: ButtonBorderParameters(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
              forceCaprasimo: true, color: AppColors.primary, fontSize: 27.5),
          Spacer(),
          GetBuilder<HomePageController>(
            id: _.resultsExistsKey,
            builder: (controller) => _.resultsData.isEmpty
                ? TextButton(
                    onPressed: _.launchFaqUrl,
                    child: AppTexts.regular(S.of(context).faq,
                        bold: true, color: AppColors.primary),
                  )
                : TextButton(
                    onPressed: _.eggPressed,
                    child: Obx(() => SvgPicture.asset(
                          'assets/images/ic_egg.svg',
                          colorFilter: ColorFilter.mode(
                              _.showBanner
                                  ? AppColors.lightYellow
                                  : AppColors.primary,
                              BlendMode.srcIn),
                        )),
                  ),
          ),
          TextButton(
            onPressed: _.goToSettings,
            child: SvgPicture.asset('assets/images/ic_filter.svg'),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyPageView(HomePageController _) {
    return Expanded(
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
                    child: Center(
                      child: Padding(
                          padding: AppDimens.lateralPadding,
                          child: Obx(() => SvgPicture.asset(
                                _.imageForIndex(index,
                                    ElectionManager.currentElection.value),
                              ))),
                    ),
                  ),
                  CustomSpacer(multiplier: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.extraLargeLateralPaddingValue),
                    child: AppTexts.small(
                      _.textForIndex(context, index,
                          ElectionManager.currentElection.value),
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
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, HomePageController _) {
    return Padding(
      padding: AppDimens.lateralPadding,
      child: Column(
        children: [
          FutureBuilder<int?>(
            future: DataRepository().fetchStatistics(),
            builder: (BuildContext context, AsyncSnapshot<int?> snapshot) {
              return AppTexts.small(
                  S.of(context).homePageMatchesFoundQuote(snapshot.data ?? 'X'),
                  textAlign: TextAlign.center,
                  color: AppColors.primary);
            },
          ),
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
                    onPressed: _.backToResultsOrTest,
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
