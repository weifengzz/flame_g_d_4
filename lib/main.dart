import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  runApp(
    GameWidget(
      game: MySpinGame(),
    ),
  );
}

class MySpinGame extends FlameGame {
  late SpriteComponent woman;

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    woman = SpriteComponent()..sprite = await loadSprite('woman.png')
    ..size = Vector2.all(100.0)
    ..position=Vector2(size[0] / 2, size[1] / 2)
    ..anchor = Anchor.center;
    add(woman);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (woman.angle < 1.75 * math.pi) {
      woman.angle += .01;
    }

    if (woman.height < size[1] - 40) {
      woman.height += 1;
      woman.width += 1;
    }
  }
}
