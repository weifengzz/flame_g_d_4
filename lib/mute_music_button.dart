import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';

class MuteMusicButton extends SpriteComponent with Tappable {
    bool musicPlaying = false;

  @override
  bool onTapUp(TapUpInfo info) {
    FlameAudio.bgm.play('music.mp3', volume: 0.3);
    musicPlaying = true;
    return true;
  }
}
