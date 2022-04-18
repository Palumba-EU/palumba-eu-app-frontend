import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'assets.dart';

class PlayingAsset {
  final player = AudioPlayer();
  Asset? asset;
  RxDouble volume = 1.0.obs;

  PlayingAsset(this.asset);

  init({double initVolume = 1.0}) async {
    volume.value = initVolume;
    player.setAsset('assets/audios/${asset!.file}');

    await player.setLoopMode(LoopMode.one);
  }

  pause() async {
    await player.pause();
  }

  stop() async {
    await player.stop();
  }

  resume() async {
    await player.play();
  }

  setVolume(double newVolume) {
    if (newVolume == 0) {
      pause();
    } else {
      volume.value = newVolume;
      player.setVolume(newVolume);
    }
  }

  isEqual(Asset? asset) {
    try {
      if (asset!.id == this.asset!.id && asset.volume! == volume.value) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
