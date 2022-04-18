import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/audio_manager.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../data/models/assets.dart';
import '../styles/app_theme.dart';
import '../utils/utils.dart';

class SoundTile extends StatelessWidget {
  final int index;
  final Asset soundAsset;
  RxBool isActive = false.obs;
  Function onLongPress;
  Function onPremium;

  SoundTile(
      {Key? key,
      required this.soundAsset,
      required this.index,
      required this.onPremium,
      required this.onLongPress})
      : super(key: key);

  isAssetActive() {
    isActive.value = AudioManager().isPlaying(soundAsset: soundAsset);
  }

  @override
  Widget build(BuildContext context) {
    isAssetActive();
    return Obx(() {
      return GestureDetector(
          onTap: () {
            if (soundAsset.premium! == false) {
              if (isActive.value) {
                isActive.value = false;
                AudioManager().removeAsset(soundAsset);
              } else {
                if (AudioManager().playingAssets.length < MAX_SOUND_ASSETS) {
                  isActive.value = true;
                  AudioManager().addAsset(soundAsset);
                } else {
                  Utils.vibrateOnErrorTap();
                }
              }
            } else {
              onPremium();
              Utils.vibrateOnErrorTap();
            }
          },
          onLongPress: () {
            if (soundAsset.premium! == false) {
              if (isActive.value) {
                onLongPress();
              } else {
                if (AudioManager().playingAssets.length < MAX_SOUND_ASSETS) {
                  onLongPress();
                } else {
                  Utils.vibrateOnErrorTap();
                }
              }
            } else {
              Utils.vibrateOnErrorTap();
            }
          },
          child: Hero(
            tag: 'asset-${soundAsset.id!}',
            child: Material(
              color: Colors.transparent,
              child: Container(
                  padding: EdgeInsets.all(Styles.paddingValue / 1.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AudioManager.getIcon(soundAsset,
                              color: Colors.black.withOpacity(0.8)),
                          Expanded(child: SizedBox.shrink()),
                          soundAsset.premium!
                              ? Icon(
                                  SFSymbols.lock_fill,
                                  size: 16,
                                  color: Colors.black.withOpacity(0.8),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      AutoSizeText(
                        soundAsset.name!,
                        maxLines: 2,
                        wrapWords: false,
                        style: TextStyle(color: Colors.black.withOpacity(0.8)),
                        minFontSize: Styles.fontSizeRegularText - 3,
                        maxFontSize: Styles.fontSizeRegularText + 2,
                      ),
                      soundAsset.premium!
                          ? Styles.smallText(context, 'Premium')
                          : Obx(() {
                              if (AudioManager().audioIsPlaying.value) {}
                              var pAsset =
                                  AudioManager().getPlayingAsset(soundAsset);
                              if (pAsset == null) {
                                return Styles.smallText(context, 'Off',
                                    color: Colors.black.withOpacity(0.8));
                              }
                              return Styles.smallText(context,
                                  '${(pAsset.volume.value * 100).toInt()}%',
                                  color: Colors.black.withOpacity(0.8));
                            }),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                        isActive.value ? 1.0 : getInactiveOpacity()),
                    borderRadius: BorderRadius.circular(21),
                  )),
            ),
          ));
    });
  }

  getInactiveOpacity() {
    var row = (index / 3).toInt();
    var op = 0.5 - (row * 0.05);
    return max(op, 0.2);
  }
}
/*
* Clipping
* /*ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: ShaderMask(
              blendMode: BlendMode.xor,
              shaderCallback: (bounds) =>
                  LinearGradient(colors: [Colors.white], stops: [0.0])
                      .createShader(bounds),
              child: Container(
                  padding: EdgeInsets.all(Styles.paddingValue / 1.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AudioManager.getIcon(soundAsset),
                          Expanded(child: SizedBox.shrink()),
                          soundAsset.premium!
                              ? Icon(
                                  SFSymbols.lock_fill,
                                  size: 16,
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      AutoSizeText(
                        soundAsset.name!,
                        maxLines: 2,
                        wrapWords: false,
                        minFontSize: Styles.fontSizeRegularText - 1,
                        maxFontSize: Styles.fontSizeRegularText + 2,
                      ),
                      soundAsset.premium!
                          ? Styles.smallText(context, 'Premium')
                          : Obx(() {
                              if (AudioManager().audioIsPlaying.value) {}
                              var pAsset =
                                  AudioManager().getPlayingAsset(soundAsset);
                              if (pAsset == null) {
                                return Styles.smallText(context, 'Off',
                                    color: Colors.black);
                              }
                              return Styles.smallText(context,
                                  '${(pAsset.volume.value * 100).toInt()}%',
                                  color: Colors.black);
                            }),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                        isActive.value ? 1.0 : getInactiveOpacity()),
                    borderRadius: BorderRadius.circular(21),
                  )))*/
* */
