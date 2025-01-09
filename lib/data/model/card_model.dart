class CardModel {
  final int id;
  final String emojis;
  final String mainQuestion;
  final String details;
  final bool enableCardFlip;
  final bool isOnboardingCard;

  CardModel(
      {required this.id,
      required this.emojis,
      required this.mainQuestion,
      required this.details,
      required this.enableCardFlip,
      required this.isOnboardingCard});
}
