import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/splash/splash_screen_controller.dart';
import 'package:flutter_boilerplate/modules/volume/slider.dart';
import 'package:flutter_boilerplate/modules/volume/volume_controller.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';

import '../../data/models/playing_asset.dart';
import '../../data/audio_manager.dart';
import '../../styles/app_theme.dart';

class VolumePage extends StatelessWidget {
  const VolumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VolumeController>(
      builder: (_) => Scaffold(
          backgroundColor: Colors.black.withOpacity(0.3),
          body: SafeArea(
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Obx(() {
                  return _.maxControl.value
                      ? GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height,
                            child: Center(
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        AudioManager().playingAssets.length,
                                    separatorBuilder: (BuildContext, int idx) {
                                      return Styles.horizontalSpaces(
                                          multiplier: 1);
                                    },
                                    itemBuilder: (BuildContext, int idx) {
                                      return getControlThumb(
                                          AudioManager().playingAssets[idx],
                                          context,
                                          _);
                                    })),
                          ),
                          onTap: () {
                            Get.back();
                          },
                        )
                      : GestureDetector(
                          child: Container(
                              color: Colors.transparent,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _.asset != null
                                      ? AudioManager.getIcon(_.asset!,
                                          size: 28, color: Colors.white)
                                      : const SizedBox.shrink(),
                                  Styles.spacer(small: true),
                                  Obx(() {
                                    return Hero(
                                        tag: 'asset-${_.assetId}',
                                        child: Material(
                                          color: Colors.transparent,
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            width: 100,
                                            child: VerticalSlider(
                                              min: 0,
                                              activeTrackColor: Colors.white,
                                              inactiveTrackColor:
                                                  Colors.white.withOpacity(0.5),
                                              width: 110,
                                              max: 100,
                                              value: _.sliderValue.value,
                                              onChanged: (double value) {
                                                _.sliderValue.value = value;
                                                _.saveVolumeForAsset(value);
                                              },
                                            ),
                                          ),
                                        ));
                                  }),
                                  Styles.spacer(),
                                  _.asset != null
                                      ? Styles.smallText(context, _.asset!.name)
                                      : const SizedBox.shrink(),
                                ],
                              )),
                          onTap: () {
                            Get.back();
                          },
                        );
                }),
                Obx(() {
                  if (_.maxControl.value) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          _.controlAll();
                        },
                        child: Container(width: double.infinity, height: 80, color: Colors.transparent, child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Styles.smallText(context, 'Single control'),
                          ],
                        ),)
                      ),
                    );
                  }
                  if (AudioManager().playingAssets.length > 1) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          _.controlAll();
                        },
                        child: Container(width: double.infinity, height: 80, color: Colors.transparent, child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Styles.smallText(context, 'Fine control'),
                          ],
                        ),)

                      ),
                    );
                  }
                  return SizedBox.shrink();
                })
              ],
            ),
          )),
    );
  }

  getControlThumb(
      PlayingAsset asset, BuildContext context, VolumeController _) {
    return Hero(
        tag: 'asset-${asset.asset!.id!}',
        child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AudioManager.getIcon(asset.asset!,
                    size: 28, color: Colors.white),
                Obx(() {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: 90,
                    child: VerticalSlider(
                      min: 0,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white.withOpacity(0.5),
                      width: 90,
                      max: 100,
                      value: asset.volume.value * 100,
                      onChanged: (double value) {
                        asset.setVolume(value / 100);
                      },
                    ),
                  );
                }),
                Styles.spacer(),
                Styles.smallText(context, asset.asset!.name),
              ],
            )));
  }
}
