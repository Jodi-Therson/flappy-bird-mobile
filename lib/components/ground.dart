// File: lib/components/ground.dart
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../game/flappy_bird_game.dart';

class Ground extends PositionComponent with HasGameRef<FlappyBirdGame> {
  late SpriteComponent ground1;
  late SpriteComponent ground2;

  @override
  Future<void> onLoad() async {
    final groundImage = Flame.images.fromCache('ground.png');
    final groundSize = Vector2(gameRef.size.x, 112);

    ground1 = SpriteComponent(sprite: Sprite(groundImage), size: groundSize, position: Vector2(0, gameRef.size.y - groundSize.y));
    ground2 = SpriteComponent(sprite: Sprite(groundImage), size: groundSize, position: Vector2(groundSize.x, gameRef.size.y - groundSize.y));

    add(ground1);
    add(ground2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.state == GameState.playing) {
      ground1.x -= gameRef.pipeSpeed * dt;
      ground2.x -= gameRef.pipeSpeed * dt;

      if (ground1.x <= -gameRef.size.x) {
        ground1.x = ground2.x + gameRef.size.x;
      }
      if (ground2.x <= -gameRef.size.x) {
        ground2.x = ground1.x + gameRef.size.x;
      }
    }
  }
}