import 'package:flutter_boilerplate/data/audio_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import '../../data/models/assets.dart';
import '../../data/models/playing_asset.dart';

class VolumeController extends GetxController {
  Asset? asset;
  RxDouble sliderValue = (100.0).obs;
  RxBool maxControl = false.obs;
  int assetId = 0;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {
    asset = Get.arguments[0];
    assetId = asset!.id!;
    _processPlayingAsset();

    update();
  }

  _processPlayingAsset() {
    PlayingAsset? playingAsset = AudioManager().getPlayingAsset(asset!);
    if (playingAsset == null) {
      sliderValue.value = 0;
    } else {
      sliderValue.value = playingAsset.volume.value * 100;
    }
  }

  saveVolumeForAsset(double volume) {
    PlayingAsset? playingAsset = AudioManager().getPlayingAsset(asset!);
    if (playingAsset == null) {
      AudioManager().addAsset(asset!, volume: (volume / 100));
    } else {
      playingAsset.setVolume((volume / 100));
    }
  }

  controlAll() {
    maxControl.value = !maxControl.value;
  }
}
