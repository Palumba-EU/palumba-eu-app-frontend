import 'dart:math';

import 'package:dui/dui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palumba_eu/data/model/card_model.dart';
import 'package:palumba_eu/global_widgets/card/card_pages.dart';
import 'package:palumba_eu/global_widgets/custom_container_curve.dart';

import 'card_progressbar.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.isFirstCard = false,
    required this.card,
    required this.isPanStarted,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onTapDown,
    required this.cardAnimationDuration,
    required this.angleCard,
    required this.positionCard,
    required this.bgPosition,
    required this.currentCardIndex,
    required this.cardOpacity,
  });
  final bool isFirstCard;
  final CardModel card;
  final RxBool isPanStarted;
  final Function(DragStartDetails)? onPanStart;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;
  final Function(TapDownDetails)? onTapDown;
  final Rx<int> cardAnimationDuration;
  final double angleCard;
  final Rx<Offset> positionCard;
  final Rx<Offset> bgPosition;
  final Rx<int> currentCardIndex;
  final double cardOpacity;

  @override
  Widget build(BuildContext context) {
    final pages = [
      FirstCardPage(card),
      SecondCardPage(card),
      ThirdCardPage(card),
      FourthCardPage(card),
    ];
    return IgnorePointer(
      ignoring: !isFirstCard,
      child: Obx(
        () => ClipPath(
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
              onTapDown: onTapDown,
              child: LayoutBuilder(
                  builder: (context, constraints) => Obx(
                        () {
                          final duration = Duration(
                              milliseconds: cardAnimationDuration.value);
                          final position = isFirstCard
                              ? positionCard.value
                              : bgPosition.value;
                          final center =
                              constraints.smallest.center(Offset.zero);
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
                              opacity: cardOpacity,
                              child: AnimatedContainer(
                                duration: duration,
                                transform: rotatedMatrix
                                  ..translate(position.dx, position.dy, 0),
                                height: Get.height * .6,
                                width: Get.width * .85,
                                decoration: BoxDecoration(
                                  color: !isFirstCard
                                      ? Theme.of(context).colorScheme.primary
                                      : isPanStarted.value
                                          ? Theme.of(context)
                                              .colorScheme
                                              .background
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary,
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
                                      DUI.spacing.largeLateralPaddingValue),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CardProgressBar(
                                        step: currentCardIndex.value,
                                        totalSteps: 4,
                                      ),
                                      pages[currentCardIndex.value],
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
        ),
      ),
    );
  }
}
