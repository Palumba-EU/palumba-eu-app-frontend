import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/managers/i18n_manager/translations/generated/l10n.dart';

enum Gender { woman, man, nonBinary, genderFluid, other, none }

class GenderModel {
  final String name;
  final Gender genderEnum;

  GenderModel({required this.name, required this.genderEnum});

  static List<GenderModel> allGenders(BuildContext context) {
    return [
      GenderModel(
          name: S.of(context).onBoardingStep3Option1, genderEnum: Gender.woman),
      GenderModel(
          name: S.of(context).onBoardingStep3Option2, genderEnum: Gender.man),
      GenderModel(
          name: S.of(context).onBoardingStep3Option3,
          genderEnum: Gender.genderFluid),
      GenderModel(
          name: S.of(context).onBoardingStep3Option4,
          genderEnum: Gender.nonBinary),
      GenderModel(
          name: S.of(context).onBoardingStep3Option5, genderEnum: Gender.other),
    ];
  }
}
