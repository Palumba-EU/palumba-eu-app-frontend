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
    required this.isFrontCard,
    this.card,
    required this.isPanStarted,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    required this.cardAnimationDuration,
    required this.angleCard,
    required this.position,
    this.currentDraggedResponseStatement,
    this.selectedResponseStatement,
    this.flipCcardController,
  });

  final bool isFrontCard;
  final CardModel? card;
  final RxBool isPanStarted;
  final Function(DragStartDetails)? onPanStart;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;
  final Rx<int> cardAnimationDuration;
  final double angleCard;
  final Rx<Offset> position;
  final Rxn<StatementResponse>? currentDraggedResponseStatement;
  final StatementResponse? selectedResponseStatement;
  final FlipCardController? flipCcardController;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [];
    if (card != null && card?.details != "")
      pages.add(CardFrontPage(card!, selectedResponseStatement));
    if (card?.details != null && card?.details != "")
      pages.add(CardBackPage(card!));

    return IgnorePointer(
        ignoring: !isFrontCard, child: Obx(() => cardAlignment(pages)));
  }

  ClipPath cardAlignment(List<Widget> pages) {
    return ClipPath(
        clipper: !isFrontCard
            ? CustomContainerClipper(curveRadius: 200)
            : (isPanStarted.value
                ? null
                : CustomContainerClipper(curveRadius: 200)),
        child: SizedBox(
          height: isPanStarted.value
              ? (isFrontCard ? Get.height : Get.height * .82)
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
                              milliseconds: cardAnimationDuration.value ?? 0);
                          final center =
                              constraints.smallest.center(Offset.zero);
                          final double angle =
                              isFrontCard ? angleCard * pi / 180 : 0;
                          final rotatedMatrix = Matrix4.identity()
                            ..translate(position.value.dx, position.value.dy, 0)
                            ..rotateZ(angle)
                            ..translate(-center.dx, -center.dy, 0);
                          return Align(
                              alignment: Alignment.center,
                              widthFactor: null,
                              heightFactor: null,
                              child: AnimatedContainer(
                                  duration: duration,
                                  transform: rotatedMatrix
                                    ..translate(position.value.dx,
                                        position.value.dy, 0),
                                  height: Get.height * .575,
                                  width: Get.width * .77,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: isPanStarted.value
                                        ? boxShadow(context)
                                        : null,
                                  ),
                                  child: pages.length > 1
                                      ? flipCard(pages, context)
                                      : aCard(pages[0], context)));
                        },
                      ))),
        ));
  }

  Widget flipCard(List<Widget> pages, BuildContext context) {
    return FlipCard(
        controller: flipCcardController,
        flipOnTouch: card?.enableCardFlip ?? true,
        speed: 300,
        direction: FlipDirection.HORIZONTAL, // Flip direction
        front: aCard(pages[0], context),
        back: aCard(pages[1], context));
  }

  Widget aCard(Widget page, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Obx(() => Container(
          color: backgroundColor(
                  (currentDraggedResponseStatement ?? Rxn()).value) ??
              Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.all(AppDimens.lateralPaddingValue),
            child: page,
          ))),
    );
  }

  // Helper to not inline styling logic in view

  Color? backgroundColor(StatementResponse? response) {
    if (!isFrontCard && isPanStarted.value == false) {
      // hides the card, to not show when flipping main card
      return Colors.transparent;
    }

    if (response != null && isFrontCard && isPanStarted.value) {
      switch (response) {
        case StatementResponse.agree:
          return AppColors.lightGreen;
        case StatementResponse.stronglyAgree:
          return AppColors.green;
        case StatementResponse.disagree:
          return AppColors.lightYellow;
        case StatementResponse.stronglyDisagree:
          return AppColors.yellow;
        case StatementResponse.neutral:
          return AppColors.lightPrimary;
      }
    }
    return null;
  }

  List<BoxShadow>? boxShadow(BuildContext context) {
    return [
      BoxShadow(
        color:
            Theme.of(context).colorScheme.shadow.withAlpha((0.5 * 255).toInt()),
        blurRadius: 10,
        offset: const Offset(0, 5),
      )
    ];
  }
}
