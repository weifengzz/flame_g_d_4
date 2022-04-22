import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: MySpinGame(),
    ),
  );
}

class MySpinGame extends FlameGame {}
