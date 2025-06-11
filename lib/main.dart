// File: lib/main.dart
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game/flappy_bird_game.dart';

void main() {
  runApp(
    GameWidget(game: FlappyBirdGame()),
  );
}