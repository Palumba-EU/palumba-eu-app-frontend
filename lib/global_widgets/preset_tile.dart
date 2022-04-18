import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/audio_manager.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';
import '../data/models/preset.dart';
import '../styles/app_theme.dart';

class PresetTile extends StatelessWidget {
  final Preset soundAssets;
  Function onTap;
  Function onLongPress;
  RxBool isActive = false.obs;

  PresetTile(
      {Key? key,
      required this.soundAssets,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  isAssetActive() {
    isActive.value = AudioManager().isPresetPlaying(soundAsset: soundAssets);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
          onTap: () {
            isAssetActive();
            onTap();
          },
          onLongPress: () {
            onLongPress();
          },
          child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: Styles.paddingValue / 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: getIcons(context),
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(isActive.value ? 1.0 : 0.5),
                borderRadius: BorderRadius.circular(21),
              )));
    });
  }

  List<Widget> getIcons(BuildContext context) {
    List<Widget> content = [];

    soundAssets.assets.forEach((asset) {
      content.add(ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1 - asset.volume!, 1 - asset.volume!],
            colors: [
              Colors.white.withOpacity(0.9),
              Colors.white.withOpacity(0.9),
              Colors.black
            ],
          ).createShader(rect);
        },
        child: AudioManager.getIcon(asset, size: 20),
      ));
      content.add(Styles.horizontalSpaces(small: true));
    });
    content.removeLast();

    return content;
  }
}
