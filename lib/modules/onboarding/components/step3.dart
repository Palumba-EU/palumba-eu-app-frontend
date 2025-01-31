import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/levelOfStudy_model.dart';
import 'package:palumba_eu/global_widgets/custom_spacer.dart';
import 'package:palumba_eu/modules/onboarding/components/custom_gender_selector.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';
import 'package:palumba_eu/utils/common_ui/app_texts.dart';

class Step3 extends StatelessWidget {
  final List<LevelOfEducation> levelsofEducation;
  final RxInt indexSelected;
  final Function(int index) onLevelOfEducationPressed;

  const Step3({
    super.key,
    required this.levelsofEducation,
    required this.indexSelected,
    required this.onLevelOfEducationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: AppDimens.lateralPadding,
        child: SingleChildScrollView(
          // Make the whole page scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTexts.title("Level of Education", color: AppColors.primary),
              CustomSpacer(multiplier: 3),
              Wrap(
                spacing: 7.5,
                runSpacing: 7.5,
                children: List.generate(
                  levelsofEducation.length,
                  (index) => Obx(() => CustomGenderSelector(
                        title: levelsofEducation[index].localized(context),
                        selected: indexSelected.value == index,
                        onPressed: () {
                          onLevelOfEducationPressed(index);
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
