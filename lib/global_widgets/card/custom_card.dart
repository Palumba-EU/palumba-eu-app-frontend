import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/global_widgets/card/card_pages.dart';
import 'package:palumba_eu/global_widgets/custom_container_curve.dart';
import 'package:palumba_eu/global_widgets/custom_progress_bar.dart';
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
    this.onTapDown,
    required this.cardAnimationDuration,
    required this.angleCard,
    required this.positionCard,
    required this.bgPosition,
    this.currentCardIndex,
    required this.cardOpacity,
    this.isOnboardingCard = false,
    this.onSkipTap,
  });
  final bool isFirstCard;
  final CardModel? card;
  final RxBool isPanStarted;
  final Function(DragStartDetails)? onPanStart;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;
  final Function(TapDownDetails)? onTapDown;
  final Rx<int>? cardAnimationDuration;
  final double angleCard;
  final Rx<Offset> positionCard;
  final Rx<Offset> bgPosition;
  final Rx<int>? currentCardIndex;
  final RxDouble cardOpacity;
  final bool isOnboardingCard;
  final Function()? onSkipTap;

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> pages = [
      FirstCardPage(card, isOnboardingCard),
    ];
    if (!isOnboardingCard && card != null) {
      pages = [
        FirstCardPage(card!, isOnboardingCard),
        SecondCardPage(card!),
        ThirdCardPage(card!),
        // FourthCardPage(card!),
      ];
    }
    return IgnorePointer(
      ignoring: !isFirstCard,
      child: Obx(() => _cardContent(pages)),
    );
  }

  ClipPath _cardContent(List<StatelessWidget> pages) {
    return ClipPath(
      clipper: !isFirstCard
          ? CustomContainerClipper(curveRadius: 200)
          : (isPanStarted.value
              ? null
              : CustomContainerClipper(curveRadius: 200)),
      child: SizedBox(
        height: isPanStarted?.value ?? false
            ? (isFirstCard ? Get.height : Get.height * .82)
            : Get.height * .82,
        width: double.infinity,
        child: GestureDetector(
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanEnd: onPanEnd,
          onTapDown: isOnboardingCard ? null : onTapDown,
          child: LayoutBuilder(
              builder: (context, constraints) => Obx(
                    () {
                      final duration = Duration(
                          milliseconds: cardAnimationDuration?.value ?? 0);
                      final position =
                          isFirstCard ? positionCard.value : bgPosition.value;
                      final center = constraints.smallest.center(Offset.zero);
                      final double angle =
                          isFirstCard ? angleCard * pi / 180 : 0;
                      final rotatedMatrix = Matrix4.identity()
                        ..translate(position.dx, position.dy, 0)
                        ..rotateZ(angle)
                        ..translate(-center.dx, -center.dy, 0);
                      return Align(
                        alignment: Alignment.center,
                        widthFactor: null,
                        heightFactor: null,
                        child: AnimatedOpacity(
                          duration: duration,
                          opacity: cardOpacity.value,
                          child: AnimatedContainer(
                            duration: duration,
                            transform: rotatedMatrix
                              ..translate(position.dx, position.dy, 0),
                            height: Get.height * .575,
                            width: Get.width * .77,
                            decoration: BoxDecoration(
                              color: !isFirstCard
                                  ? Theme.of(context).colorScheme.primary
                                  : isPanStarted?.value ?? false
                                      ? Theme.of(context).colorScheme.background
                                      : Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .shadow
                                      .withOpacity(.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppDimens.bigLateralPaddingValue),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!isOnboardingCard)
                                    CustomProgressBar(
                                      step: currentCardIndex?.value ?? 0,
                                      totalSteps: pages.length,
                                      width: Get.width,
                                      onSkipTap: onSkipTap,
                                      isDotted: true,
                                    ),
                                  pages[currentCardIndex?.value ?? 0],
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
        ),
      ),
    );
  }
}
