// File: lib/game/flappy_bird_game.dart
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/bird.dart';
import '../components/ground.dart';
import '../components/pipe.dart';

enum GameState { welcome, playing, gameOver }

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent scoreText;
  late TextComponent highScoreText;
  late TextComponent startText;
  late TextComponent gameOverText;

  GameState state = GameState.welcome;
  int score = 0;
  int highScore = 0;
  final pipeSpawner = Timer(1.5, repeat: true);

  late Vector2 birdSize;
  late double pipeWidth;
  late double pipeGap;
  late double groundHeight;
  late double gameSpeed;
  late double gravity;
  late double jumpVelocity;

  @override
  Future<void> onLoad() async {
    _calculateProportionalSizes();

    await images.loadAll(['bg.png', 'ground.png', 'bird1.png', 'bird2.png', 'bird3.png', 'pipe.png', 'restart.png']);
    await FlameAudio.audioCache.loadAll(['sfx_wing.mp3', 'sfx_point.mp3', 'crash.mp3']);

    final prefs = await SharedPreferences.getInstance();
    highScore = prefs.getInt('highScore') ?? 0;

    add(SpriteComponent(sprite: Sprite(images.fromCache('bg.png')), size: size));
    add(Ground(height: groundHeight));
    bird = Bird(
      initialSize: birdSize,
      gravity: gravity,
      jumpVelocity: jumpVelocity,
    );
    add(bird);

    setupUI();
    pipeSpawner.onTick = spawnPipes;
    resetGame();
  }

  void _calculateProportionalSizes() {
    birdSize = Vector2(size.x * 0.08, size.x * 0.08 * (24 / 34)); // Aspect ratio asli 34x24
    pipeWidth = size.x * 0.15;
    pipeGap = size.y * 0.23;
    groundHeight = size.y * 0.12;

    gameSpeed = size.x * 0.5; // Kecepatan game (pipa & tanah)
    gravity = size.y * 1.1;
    jumpVelocity = -(size.y / 2.8); // Lompatan lebih tinggi pada layar yang lebih besar
  }

  void setupUI() {
    final bigTextStyle = TextStyle(fontSize: size.x * 0.09, color: Colors.white, fontWeight: FontWeight.bold);
    final mediumTextStyle = bigTextStyle.copyWith(fontSize: size.x * 0.07);
    final smallTextStyle = bigTextStyle.copyWith(fontSize: size.x * 0.05);

    scoreText = TextComponent(text: 'Score: 0', position: Vector2(20, 20), textRenderer: TextPaint(style: mediumTextStyle));
    highScoreText = TextComponent(text: 'High Score: $highScore', textRenderer: TextPaint(style: smallTextStyle));
    startText = TextComponent(text: 'TAP TO START', anchor: Anchor.center, position: size / 2, textRenderer: TextPaint(style: mediumTextStyle));
    gameOverText = TextComponent(text: 'GAME OVER', anchor: Anchor.center, textRenderer: TextPaint(style: bigTextStyle));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (state == GameState.playing) {
      pipeSpawner.update(dt);
      scoreText.text = 'Score: $score';
    }
  }

  @override
  void onTap() {
    super.onTap();
    if (state == GameState.welcome) {
      startGame();
    } else if (state == GameState.playing) {
      bird.jump();
    }
  }

  void spawnPipes() {
    double centerY = Random().nextDouble() * (size.y - (pipeGap + groundHeight) * 2) + (pipeGap + groundHeight);

    add(Pipe(isTop: true, height: centerY - pipeGap / 2, size: Vector2(pipeWidth, centerY - pipeGap / 2), position: Vector2(size.x, 0)));
    add(Pipe(isTop: false, height: size.y - (centerY + pipeGap / 2), size: Vector2(pipeWidth, size.y - (centerY + pipeGap / 2)), position: Vector2(size.x, centerY + pipeGap / 2)));
  }

  void increaseScore() {
    score++;
    FlameAudio.play('sfx_point.mp3');
  }

  void setGameOver() async {
    if (state == GameState.gameOver) return;

    state = GameState.gameOver;
    FlameAudio.play('crash.mp3');
    bird.removeFromParent();
    pipeSpawner.stop();

    if (score > highScore) {
      highScore = score;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('highScore', highScore);
    }

    gameOverText.position = size / 2 - Vector2(0, size.y * 0.1);
    scoreText.position = size / 2 + Vector2(-scoreText.width / 2, size.y * 0.02);
    highScoreText.text = 'High Score: $highScore';
    highScoreText.position = size / 2 + Vector2(-highScoreText.width / 2, size.y * 0.1);

    add(gameOverText);
    add(highScoreText);

    final restartButton = ButtonComponent(
      button: SpriteComponent(sprite: Sprite(images.fromCache('restart.png')), size: Vector2(size.x * 0.25, size.x * 0.15)),
      anchor: Anchor.center,
      position: size / 2 + Vector2(0, size.y * 0.2),
      onPressed: resetGame,
    );
    add(restartButton);
  }

  void startGame() {
    state = GameState.playing;
    bird.jump();
    pipeSpawner.start();
    startText.removeFromParent();
  }

  void resetGame() {
    children.whereType<Pipe>().forEach((pipe) => pipe.removeFromParent());
    children.whereType<ButtonComponent>().forEach((button) => button.removeFromParent());
    gameOverText.removeFromParent();
    highScoreText.removeFromParent();

    state = GameState.welcome;
    score = 0;
    scoreText.text = 'Score: $score';
    scoreText.position = Vector2(20, 20);

    bird.position = Vector2(size.x * 0.2, size.y / 2);
    bird.angle = 0;
    if (!bird.isMounted) add(bird);
    if (!scoreText.isMounted) add(scoreText);
    if (!startText.isMounted) add(startText);
  }
}
