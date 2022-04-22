import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class WomanTextBox extends TextBoxComponent {
  WomanTextBox(String text)
      : super(
          text: text,
          boxConfig: TextBoxConfig(
            timePerChar: .2,
          ),
        );

  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(
      rect,
      Paint()..color = Colors.transparent,
    );
  }
}
