import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/preset_manager.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'models/assets.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'models/playing_asset.dart';
import 'models/preset.dart';

const MAX_SOUND_ASSETS = 3;

class AudioManager {
  static final AudioManager _singleton = new AudioManager._internal();

  factory AudioManager() {
    return _singleton;
  }

  AudioManager._internal();

  static AudioManager getInstance() {
    return new AudioManager();
  }

  /*
  * Media Playback
  * */
  RxString timerString = "00:00:00".obs;
  RxBool audioIsPlaying = false.obs;
  StopWatchTimer? _stopWatchTimer;

  play() {
    if (playingAssets.isNotEmpty) {
      audioIsPlaying.value = true;
      startTimer();
      playingAssets.forEach((element) {
        element.resume();
      });
    }
  }

  pause() {
    audioIsPlaying.value = false;
    pauseTimer();
    playingAssets.forEach((element) {
      element.pause();
    });
  }

  checkPlay() {
    if (playingAssets.isNotEmpty) {
      play();
    } else {
      pause();
    }
  }

  startTimer() {
    _stopWatchTimer ??= StopWatchTimer(onChange: (value) {
      timerString.value =
          StopWatchTimer.getDisplayTime(value, milliSecond: false);
    });
    _stopWatchTimer!.onExecute.add(StopWatchExecute.start);
  }

  pauseTimer() {
    if (_stopWatchTimer != null) {
      _stopWatchTimer!.onExecute.add(StopWatchExecute.stop);
    }
  }

  clearTimer() {
    if (_stopWatchTimer != null) {
      _stopWatchTimer!.onExecute.add(StopWatchExecute.reset);
    }
  }

  bool isPlaying({Asset? soundAsset}) {
    if (soundAsset != null) {
      try {
        for (var asset in AudioManager().playingAssets) {
          if (asset.asset!.id == soundAsset.id) {
            return true;
          }
        }
        return false;
      } catch (e) {
        return false;
      }
    } else {
      return playingAssets.isNotEmpty;
    }
  }

  /*
  * Load audio assets
  * */
  RxList<Asset> audioAssets = <Asset>[].obs;

  Future<String> getJson() {
    return rootBundle.loadString('assets/data.json');
  }

  loadAssets() async {
    var myData = json.decode(await getJson());
    var ass = Assets.fromJson(myData);

    List<String> cacheAssets = [];
    ass.assets!.forEach((asset) {
      cacheAssets.add(asset.file!);
    });
    audioAssets.value = ass.assets!;
  }

  /*
  * Media Player
  * */
  RxList<PlayingAsset> playingAssets = <PlayingAsset>[].obs;

  addAsset(Asset asset, {double volume = 0.8}) {
    var pAsset = PlayingAsset(asset);
    pAsset.init(initVolume: volume);
    playingAssets.add(pAsset);
    checkPlay();
  }

  removeAsset(Asset asset) {
    var ass = playingAssets.firstWhere((ass) {
      return ass.asset!.id == asset.id;
    });
    ass.pause();
    playingAssets.removeWhere((ass) {
      return ass.asset!.id == asset.id;
    });
    checkPlay();
  }

  PlayingAsset? getPlayingAsset(Asset asset) {
    try {
      var ass = playingAssets.firstWhere((ass) {
        return ass.asset!.id == asset.id;
      });
      return ass;
    } catch (e) {
      return null;
    }
  }

  /*
  * Icon Management
  * */
  static getIcon(Asset soundAsset,
      {double size = 22, Color? color = Colors.black}) {
    var icon = SFSymbols.waveform;
    if (soundAsset.icon == "airplane") {
      icon = SFSymbols.airplane;
    } else if (soundAsset.icon == "drop") {
      icon = SFSymbols.drop;
    } else if (soundAsset.icon == "building.2") {
      icon = SFSymbols.building_2_fill;
    } else if (soundAsset.icon == "sparkles") {
      icon = SFSymbols.sparkles;
    } else if (soundAsset.icon == "flame") {
      icon = SFSymbols.flame;
    } else if (soundAsset.icon == "cloud.bolt.rain") {
      icon = SFSymbols.cloud_bolt_rain;
    } else if (soundAsset.icon == "wind") {
      icon = SFSymbols.wind;
    } else if (soundAsset.icon == "tram") {
      icon = SFSymbols.tram_fill;
    } else if (soundAsset.icon == "moon.stars") {
      icon = SFSymbols.moon_stars;
    } else if (soundAsset.icon == "coffee") {
      icon = Icons.coffee;
    } else if (soundAsset.icon == "tree") {
      icon = CupertinoIcons.tree;
    } else if (soundAsset.icon == "leaves") {
      icon = CupertinoIcons.tree;
    } else if (soundAsset.icon == "aqi.medium") {
      icon = SFSymbols.waveform;
    } else if (soundAsset.icon == "waterfall") {
      icon = SFSymbols.drop;
    } else if (soundAsset.icon == "sea") {
      icon = SFSymbols.tornado;
    } else if (soundAsset.icon == "fanblades") {
      icon = Icons.flip_camera_android_rounded;
    }

    return Icon(
      icon,
      size: size,
      color: color,
    );
  }

  /*
  * Preset Management
  * */
  savePreset(List<PlayingAsset> savePreset) {
    var preset = Preset();
    savePreset.forEach((element) {
      var ass = element.asset!;
      ass.volume = element.volume.value;
      preset.assets.add(ass);
    });
    PresetManager().saveData(preset);
  }



  loadPreset(Preset preset) {
    if (playingAssets.isNotEmpty) {
      audioIsPlaying.value = true;
      playingAssets.forEach((element) {
        element.stop();
      });
    }
    preset.assets.forEach((asset) {
      addAsset(asset, volume: asset.volume!);
    });
  }

  bool isPresetPlaying({Preset? soundAsset}) {
    for (var asset in playingAssets.value) {
      for (var presetAssets in soundAsset!.assets) {
        if (asset.isEqual(presetAssets) == false) {
          return false;
        }
      }
    }

    return true;
  }
}
