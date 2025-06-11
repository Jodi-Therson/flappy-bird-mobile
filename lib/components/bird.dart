// File: lib/components/bird.dart
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import '../game/flappy_bird_game.dart';

class Bird extends SpriteAnimationComponent with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  double velocity = 0;
  final double gravity = 400;

  Bird() : super(size: Vector2(51, 36), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'bird1.png', // Hanya perlu satu nama file jika formatnya 'bird1.png', 'bird2.png', ...
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.1,
        textureSize: Vector2(34, 24),
      ),
    );
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.state == GameState.playing) {
      velocity += gravity * dt;
      position.y += velocity * dt;
      angle = (velocity * 0.001).clamp(-0.4, 0.8);

      if (position.y > gameRef.size.y - 60) {
        gameRef.setGameOver();
      }
    }
  }

  void jump() {
    velocity = -250;
    FlameAudio.play('sfx_wing.mp3');
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameRef.setGameOver();
  }
}