import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/global_widgets/card/card_back_page.dart';
import 'package:palumba_eu/global_widgets/card/card_front_page.dart';
import 'package:palumba_eu/global_widgets/custom_container_curve.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';
import 'package:palumba_eu/utils/common_ui/app_dimens.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.isFirstCard = false,
    this.card,
    required this.isPanStarted,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    required this.cardAnimationDuration,
    required this.angleCard,
    required this.positionCard,
    required this.bgPosition,
    this.isOnboardingCard = false,
    this.onSkipTap,
    this.scale,
    this.isZoneButtonEntered,
    this.selectedBackgroundColor,
    this.onBoardingButtonSelected,
    this.flipCcardController,
  });

  final bool isFirstCard;
  final CardModel? card;
  final RxBool isPanStarted;
  final Function(DragStartDetails)? onPanStart;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;
  final Rx<int>? cardAnimationDuration;
  final double angleCard;
  final Rx<Offset> positionCard;
  final Rx<Offset> bgPosition;
  final bool isOnboardingCard;
  final Function()? onSkipTap;
  final double? scale;
  final RxBool? isZoneButtonEntered;
  final Color? selectedBackgroundColor;
  final StatementResponse? onBoardingButtonSelected;
  final FlipCardController? flipCcardController;

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> pages = [
      CardFrontPage(card, isOnboardingCard,
          onBoardingButtonSelected: onBoardingButtonSelected),
    ];
    if (!isOnboardingCard && card != null) {
      pages = [
        CardFrontPage(card!, isOnboardingCard),
        CardBackPage(card!),
      ];
    }
    return IgnorePointer(
        ignoring: !isFirstCard, child: Obx(() => cardAlignment(pages)));
  }

  ClipPath cardAlignment(List<StatelessWidget> pages) {
    return ClipPath(
        clipper: !isFirstCard
            ? CustomContainerClipper(curveRadius: 200)
            : (isPanStarted.value
                ? null
                : CustomContainerClipper(curveRadius: 200)),
        child: SizedBox(
          height: isPanStarted.value
              ? (isFirstCard ? Get.height : Get.height * .82)
              : Get.height * .82,
          width: double.infinity,
          child: GestureDetector(
              onPanStart: onPanStart,
              onPanUpdate: onPanUpdate,
              onPanEnd: onPanEnd,
              child: LayoutBuilder(
                  builder: (context, constraints) => Obx(
                        () {
                          final duration = Duration(
                              milliseconds: cardAnimationDuration?.value ?? 0);
                          final position = isFirstCard
                              ? positionCard.value
                              : bgPosition.value;
                          final center =
                              constraints.smallest.center(Offset.zero);
                          final double angle =
                              isFirstCard ? angleCard * pi / 180 : 0;
                          final double scaleValue =
                              isFirstCard ? scale ?? 1 : 1;
                          final rotatedMatrix = Matrix4.identity()
                            ..translate(position.dx, position.dy, 0)
                            ..rotateZ(angle)
                            ..translate(-center.dx, -center.dy, 0);
                          return Align(
                              alignment: Alignment.center,
                              widthFactor: null,
                              heightFactor: null,
                              child: AnimatedContainer(
                                  duration: duration,
                                  transform: rotatedMatrix
                                    ..translate(position.dx, position.dy, 0)
                                    ..scale(scaleValue, scaleValue, 1.0),
                                  height: Get.height * .575,
                                  width: Get.width * .77,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: boxShadow(context),
                                  ),
                                  child: pages.length > 1
                                      ? flipCard(pages, context)
                                      : aCard(pages[1], context)));
                        },
                      ))),
        ));
  }

  Widget flipCard(List<StatelessWidget> pages, BuildContext context) {
    return FlipCard(
        controller: flipCcardController,
        flipOnTouch: card?.enableCardFlip ?? true,
        direction: FlipDirection.HORIZONTAL, // Flip direction
        front: aCard(pages[0], context),
        back: aCard(pages[1], context));
  }

  Widget aCard(StatelessWidget page, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          color: backgroundColor(context),
          child: Padding(
            padding: EdgeInsets.all(AppDimens.lateralPaddingValue),
            child: page,
          )),
    );
  }

  // Helper to not inline styling logic in view

  Color backgroundColor(BuildContext context) {
    if (!isFirstCard && isPanStarted.value == false) {
      // hides the card, to not show when flipping main card
      return Colors.transparent;
    }
    var otherCheck =
        !(isZoneButtonEntered == null ? true : !isZoneButtonEntered!.value);
    if (isFirstCard && isPanStarted.value && otherCheck) {
      return selectedBackgroundColor ?? AppColors.blue;
    }
    return Theme.of(context).colorScheme.primary;
  }

  List<BoxShadow>? boxShadow(BuildContext context) {
    return isPanStarted.value
        ? [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .shadow
                  .withAlpha((0.5 * 255).toInt()),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ]
        : null;
  }
}
