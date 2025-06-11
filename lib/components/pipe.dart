// File: lib/components/pipe.dart
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../game/flappy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  final bool isTop;
  final double height;
  bool scored = false;

  Pipe({
    required this.isTop,
    required this.height,
    required super.size,
    required super.position,
  }) : super(sprite: Sprite(Flame.images.fromCache('pipe.png')));

  @override
  Future<void> onLoad() async {
    if (isTop) {
      flipVertically();
    }
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.state == GameState.playing) {
      position.x -= gameRef.pipeSpeed * dt;

      if (!scored && position.x + width < gameRef.bird.position.x) {
        if (!isTop) {
          gameRef.increaseScore();
        }
        scored = true;
      }
      if (position.x < -width) {
        removeFromParent();
      }
    }
  }
}