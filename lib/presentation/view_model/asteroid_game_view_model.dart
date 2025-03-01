import 'dart:async';

import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:astroid_game/domain/usecases/check_collision.dart';
import 'package:astroid_game/domain/usecases/move_enemies.dart';
import 'package:astroid_game/domain/usecases/spawn_enemies.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/player.dart';
import '../../domain/usecases/update_position.dart';

class AsteroidGameViewModel extends ChangeNotifier {
  AsteroidGameViewModel({
    required this.updatePositionUseCase,
    required this.spawnEnemiesUseCase,
    required this.moveEnemiesUseCase,
    required this.checkCollisionUseCase,
  });
  final UpdatePositionUseCase updatePositionUseCase;
  final MoveEnemiesUseCase moveEnemiesUseCase;
  final SpawnEnemiesUseCase spawnEnemiesUseCase;
  final CheckCollisionUseCase checkCollisionUseCase;

  bool _gameOver = false;
  Timer? _timer;
  Offset cursorPosition = Offset(200, 200);

  Player player = Player(position: Offset(200, 200), size: 10);
  void onHover(Offset newOffset) {
    cursorPosition = newOffset;
  }

  List<Enemy> enemies = [];

  void startGameLoop({
    required int count,
    required Size size,
    required void Function() onGameOver,
  }) {
    enemies = spawnEnemiesUseCase(count, size);
    _gameOver = false;
    notifyListeners();
    // setting duration as 16ms so that game could run on 60 fps
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_gameOver) {
        timer.cancel();
        return;
      }
      player = updatePositionUseCase(player, cursorPosition, 3.0);
      notifyListeners();
      enemies = moveEnemiesUseCase(enemies);
      if (checkCollisionUseCase(player, enemies)) {
        _gameOver = true;
        onGameOver.call();
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
