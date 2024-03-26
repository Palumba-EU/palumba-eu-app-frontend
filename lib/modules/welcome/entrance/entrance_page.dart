import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:palumba_eu/data/global_widgets/custom_button.dart';

import 'package:palumba_eu/data/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/welcome/entrance/entrance_controller.dart';

import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntranceController>(
      builder: (_) => Scaffold(
          backgroundColor: AppColors.primary,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/images/img_background_lilac.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SafeArea(
                  child: Padding(
                padding: AppDimens.lateralPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSpacer(multiplier: 6),
                    //TODO
                    CustomSpacer(),
                    Expanded(child: const SizedBox.shrink()),
                    CustomSpacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CustomButton(
                        onPressed: () {
                          _.onContinueTap();
                        },
                        text: S.of(context).textContinue,
                      ),
                    ),
                    CustomSpacer(multiplier: 3),
                  ],
                ),
              )),
            ],
          )),
    );
  }
}
