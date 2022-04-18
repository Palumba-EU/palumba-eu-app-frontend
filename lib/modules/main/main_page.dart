import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/audio_manager.dart';
import 'package:flutter_boilerplate/global_widgets/loading.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../data/preset_manager.dart';
import '../../global_widgets/preset_tile.dart';
import '../../global_widgets/sound_tile.dart';
import '../../styles/app_theme.dart';
import '../../utils/utils.dart';
import 'main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                _getBackgroundImage(),
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height,
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          child: Column(
                            children: [
                              Styles.spacer(multiplier: 4),
                              Styles.h2TitleText(context, _getHelloMessage()),
                              Styles.spacer(multiplier: 1),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Styles.paddingValue,
                          )),
                      Obx(() {
                        if (PresetManager().presets.value.isEmpty) {
                          return SizedBox.shrink();
                        }
                        return Container(
                          padding:
                              EdgeInsets.only(bottom: 20, left: 20, right: 20),
                          height: 60,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: PresetManager().presets.value.length,
                              separatorBuilder: (context, idx) {
                                return Styles.horizontalSpaces(small: true);
                              },
                              itemBuilder: (context, idx) {
                                return PresetTile(
                                  onLongPress: () {
                                    PresetManager().removePreset(
                                        PresetManager().presets.value[idx]);
                                  },
                                  onTap: () {
                                    AudioManager().loadPreset(
                                        PresetManager().presets.value[idx]);
                                    _.update();
                                  },
                                  soundAssets:
                                      PresetManager().presets.value[idx],
                                );
                              }),
                        );
                      }),
                      Padding(
                          child: Column(children: [
                            Obx(() {
                              return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing:
                                              Styles.paddingValue / 1.5,
                                          mainAxisSpacing:
                                              Styles.paddingValue / 1.5,
                                          childAspectRatio: 1),
                                  itemCount: AudioManager().audioAssets.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return SoundTile(
                                      onPremium: () {
                                        _.toPurchase(
                                            AudioManager().audioAssets[index]);
                                      },
                                      onLongPress: () {
                                        _.toVolume(
                                            AudioManager().audioAssets[index]);
                                      },
                                      index: index,
                                      soundAsset:
                                          AudioManager().audioAssets[index],
                                    );
                                  });
                            }),
                          ]),
                          padding: EdgeInsets.symmetric(
                            horizontal: Styles.paddingValue,
                          )),
                      Styles.spacer(multiplier: 6),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Styles.h3TitleText(context, 'noizz'),
                            SizedBox(height: 4),
                            Obx(() {
                              return Styles.smallText(
                                  context, AudioManager().timerString.value);
                            })
                          ],
                        ),
                      ),
                      Obx(() {
                        if (AudioManager().playingAssets.value.length <= 1) {
                          return SizedBox.shrink();
                        }
                        return FloatingActionButton(
                            heroTag: 'save_preset',
                            mini: true,
                            elevation: 0,
                            backgroundColor: Colors.white,
                            onPressed: () {
                              AudioManager()
                                  .savePreset(AudioManager().playingAssets);
                              _.update();
                              Utils.vibrateOnTap();
                            },
                            child: const Padding(
                                child: Icon(
                                  SFSymbols.arrow_down,
                                  size: 18,
                                ),
                                padding: EdgeInsets.only(
                                  left: 0,
                                )));
                      }),
                      Styles.horizontalSpaces(small: true),
                      FloatingActionButton(
                          heroTag: 'media_playback',
                          elevation: 0,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            if (AudioManager().audioIsPlaying.value == false) {
                              AudioManager().play();
                            } else {
                              AudioManager().pause();
                            }
                            Utils.vibrateOnTap();
                          },
                          child: Obx(() {
                            return Padding(
                                child: Icon(
                                  AudioManager().audioIsPlaying.value
                                      ? SFSymbols.pause
                                      : SFSymbols.play_fill,
                                  size: 22,
                                ),
                                padding: EdgeInsets.only(
                                  left: AudioManager().audioIsPlaying.value
                                      ? 0
                                      : 4,
                                ));
                          }))
                    ],
                  ),
                  padding: EdgeInsets.all(Styles.paddingValue),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _getBackgroundImage() {
    var date = DateTime.now();
    if (date.hour > 8 && date.hour <= 14) {
      return 'assets/images/003.png';
    } else if (date.hour > 14 && date.hour <= 19) {
      return 'assets/images/002.png';
    }
    return 'assets/images/001.png';
  }

  _getHelloMessage() {
    var date = DateTime.now();
    if (date.hour > 8 && date.hour <= 14) {
      return 'Good morning';
    } else if (date.hour > 14 && date.hour <= 19) {
      return 'Good evening';
    }
    return 'Good Night';
  }
}
