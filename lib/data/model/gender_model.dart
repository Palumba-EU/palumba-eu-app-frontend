enum Gender { woman, man, nonBinary, genderFluid, other, none }

class GenderModel {
  final String name;
  final Gender genderEnum;

  GenderModel({required this.name, required this.genderEnum});
}
