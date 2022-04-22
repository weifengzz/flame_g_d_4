import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_g_d_4/start_button.dart';
import 'package:flame_g_d_4/woman_text_box.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'mute_music_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: MySpinGame(),
    ),
  );
}

class MySpinGame extends FlameGame with HasTappables {
  late SpriteComponent woman;
  late MuteMusicButton musicButton;
  late StartButton startButton;
  late WomanTextBox womanTextBox;

  bool addWoman = false;

  String message = 'There is my favorite girl. hahhahahahahha';

  @override
  Color backgroundColor() {
    return Colors.blueGrey;
  }

  @override
  Future<void>? onLoad() async {
    super.onLoad();

    musicButton = MuteMusicButton()
      ..sprite = await loadSprite('mute.png')
      ..size = Vector2.all(30.0);
    add(musicButton);

    startButton = StartButton()
      ..sprite = await loadSprite('start.png')
      ..size = Vector2.all(300.0)
      ..anchor = Anchor.center
      ..position = Vector2(size[0] / 2, size[1] / 2);

    add(startButton);
    woman = SpriteComponent()
      ..sprite = await loadSprite('woman.png')
      ..size = Vector2(100.0, 100.0)
      ..position = Vector2(size[0] / 2, size[1] / 2)
      ..anchor = Anchor.center;
    FlameAudio.bgm.initialize();

    womanTextBox = WomanTextBox(message)
      ..anchor = Anchor.bottomLeft
      ..position = Vector2(0, size[1]);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (addWoman && !woman.isMounted) {
      remove(startButton);
      FlameAudio.bgm.play('music.mp3', volume: 0.3);
      add(woman);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (addWoman) {
      if (woman.angle < 1.75 * math.pi) {
        woman.angle += .01;
      }
      if (woman.height < size[1] - 40) {
        woman.height += 1;
        woman.width += 1;
      } else {
        if (!womanTextBox.isMounted) {
          add(womanTextBox);
        }
      }
    }
  }
}
