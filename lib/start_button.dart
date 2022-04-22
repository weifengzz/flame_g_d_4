import 'package:flame/components.dart';
import 'package:flame/input.dart';

import 'main.dart';

class StartButton extends SpriteComponent with Tappable, HasGameRef<MySpinGame>{
  @override
  bool onTapUp(TapUpInfo info) {
    gameRef.addWoman = true;
    return true;
  }
}