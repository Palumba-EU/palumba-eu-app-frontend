import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/data/repositories/remote/data_repository.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';

import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';

import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntranceController>(
      builder: (_) => Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(context, _),
              _buildBody(_),
              _buildFooter(context, _)
            ],
          ))),
    );
  }

  Padding _buildHeader(BuildContext context, EntranceController _) {
    return Padding(
      padding: AppDimens.lateralPadding,
      child: Column(
        children: [
          Row(
            children: [
              CustomSpacer(multiplier: 6),
              AppTexts.small("#" + S.of(context).shortAppName,
                  color: AppColors.primary),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  _.onTikTokTap();
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    'assets/images/ic_tiktok.svg',
                    height: 12,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _.onInstagramTap();
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    'assets/images/ic_instagram.svg',
                    height: 12,
                  ),
                ),
              ),
              /*GestureDetector(
                onTap: () {
                  _.onTwitter();
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/images/ic_twitter.svg'),
                ),
              ),*/
            ],
          ),
          CustomSpacer(multiplier: 3),
        ],
      ),
    );
  }

  Expanded _buildBody(EntranceController _) {
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
                  Padding(
                    padding: AppDimens.lateralPadding,
                    child: AppTexts.title(
                        index == 0
                            ? S.of(context).entranceTitle1
                            : index == 1
                                ? S.of(context).entranceTitle2
                                : S.of(context).entranceTitle3,
                        textAlign: TextAlign.center,
                        color: AppColors.primary,
                        fontSize: AppDimens.fontSizeBig),
                  ),
                  CustomSpacer(
                    multiplier: 4,
                  ),
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
            multiplier: 6,
          ),
        ],
      ),
    );
  }

  Padding _buildFooter(BuildContext context, EntranceController _) {
    return Padding(
      padding: AppDimens.lateralPadding,
      child: Column(
        children: [
          FutureBuilder<int?>(
            future: DataRepository().fetchStatistics(),
            builder: (BuildContext context, AsyncSnapshot<int?> snapshot) {
              return AppTexts.small(
                  S.of(context).entranceMatchesFoundQuote(snapshot.data ?? 'X'),
                  textAlign: TextAlign.center,
                  color: AppColors.primary);
            },
          ),
          CustomSpacer(
            multiplier: 2,
          ),
          CustomButton(
            onPressed: () {
              _.onContinueTap();
            },
            text: S.of(context).entranceStartButton,
            expanded: true,
            suffixIcon: IconButtonParameters('ic_arrow_right',
                color: AppColors.primary),
          ),
          CustomSpacer(multiplier: 3),
        ],
      ),
    );
  }
}
