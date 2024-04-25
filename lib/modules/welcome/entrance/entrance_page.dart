import 'package:flutter/material.dart';

import 'package:get/get.dart';
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

  Padding _buildFooter(BuildContext context, EntranceController _) {
    return Padding(
      padding: AppDimens.lateralPadding,
      child: Column(
        children: [
          CustomSpacer(),
          //TODO: Get the real number of matches from api
          AppTexts.small(S.of(context).entranceMatchesFoundQuote('X'),
              textAlign: TextAlign.center, color: AppColors.primary),
          CustomSpacer(),
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
                    child: AppTexts.title(S.of(context).entranceTitle,
                        textAlign: TextAlign.center,
                        color: AppColors.primary,
                        fontSize: AppDimens.fontSizeBig),
                  ),
                  CustomSpacer(
                    multiplier: 4,
                  ),
                  Expanded(
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/img_pigeon.svg',
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
}
