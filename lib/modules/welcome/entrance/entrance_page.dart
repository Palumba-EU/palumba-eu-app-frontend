import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/global_widgets/custom_button.dart';
import 'package:palumba_eu/global_widgets/custom_horizontal_spacer.dart';

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
              _buildHeader(context),
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
          AppTexts.small(
              S.of(context).entranceMatchesFoundQuote('10,365', '24'),
              textAlign: TextAlign.center,
              color: AppColors.primary),
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
              itemCount: 3, //TODO: Get the real number of pages
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: AppDimens.lateralPadding,
                    child: AppTexts.title(S.of(context).entranceTitle,
                        textAlign: TextAlign.center,
                        color: AppColors.primary,
                        fontSize: AppDimens.fontSizeBig),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/pigeon.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomSpacer(),
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
          CustomSpacer(
            multiplier: 6,
          ),
        ],
      ),
    );
  }

  Padding _buildHeader(BuildContext context) {
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
              SvgPicture.asset('assets/images/ic_tiktok.svg'),
              CustomHorizontalSpacer(),
              SvgPicture.asset('assets/images/ic_instagram.svg'),
              CustomHorizontalSpacer(),
              SvgPicture.asset('assets/images/ic_twitter.svg'),
            ],
          ),
          CustomSpacer(multiplier: 3),
        ],
      ),
    );
  }
}
