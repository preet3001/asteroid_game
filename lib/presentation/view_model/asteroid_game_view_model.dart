import 'dart:async';

import 'package:astroid_game/domain/entities/bullet.dart';
import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:astroid_game/domain/usecases/bullet_enemy_collision_usecase.dart';
import 'package:astroid_game/domain/usecases/check_collision_usecase.dart';
import 'package:astroid_game/domain/usecases/move_bullets_usecase.dart';
import 'package:astroid_game/domain/usecases/move_enemies_usecase.dart';
import 'package:astroid_game/domain/usecases/shoot_bullet_usecase.dart';
import 'package:astroid_game/domain/usecases/spawn_enemies_usecase.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/player.dart';
import '../../domain/usecases/update_position_usecase.dart';

class AsteroidGameViewModel extends ChangeNotifier {
  AsteroidGameViewModel({
    required this.updatePositionUseCase,
    required this.spawnEnemiesUseCase,
    required this.moveEnemiesUseCase,
    required this.checkCollisionUseCase,
    required this.shootBulletUsecase,
    required this.moveBulletsUsecase,
    required this.bulletEnemyCollisionUsecase,
  });
  final UpdatePositionUseCase updatePositionUseCase;
  final MoveEnemiesUseCase moveEnemiesUseCase;
  final SpawnEnemiesUseCase spawnEnemiesUseCase;
  final PlayerEnemyCollisionUseCase checkCollisionUseCase;
  final ShootBulletUsecase shootBulletUsecase;
  final MoveBulletsUsecase moveBulletsUsecase;
  final BulletEnemyCollisionUsecase bulletEnemyCollisionUsecase;

  bool _gameOver = false;
  Timer? _gameLoopTimer;
  Timer? _enemySpawnTimer;
  Timer? _gameDurationTimer;
  int gameDurationSeconds = 0;
  Offset cursorPosition = Offset(200, 200);

  Player player = Player(
    position: Offset(200, 200),
    size: 10,
    velocity: Offset(200, 200),
  );
  void onHover(Offset newOffset) {
    cursorPosition = newOffset;
  }

  List<Enemy> enemies = [];

  List<Bullet> bullets = [];

  void startGameLoop({
    required Size size,
    required void Function() onGameOver,
  }) {
    _gameOver = false;
    gameDurationSeconds = 0;
    enemies = [];
    bullets = [];
    _gameDurationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_gameOver) {
        timer.cancel();
        return;
      }
      gameDurationSeconds++;
    });
    _enemySpawnTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_gameOver) {
        timer.cancel();
        return;
      }
      enemies.add(spawnEnemiesUseCase(size));
    });
    // setting duration as 16ms so that game could run on 60 fps
    _gameLoopTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_gameOver) {
        timer.cancel();
        return;
      }
      player = updatePositionUseCase(player, cursorPosition, 3.0);
      enemies = moveEnemiesUseCase(enemies);
      enemies = bulletEnemyCollisionUsecase(bullets: bullets, enemies: enemies);
      bullets = moveBulletsUsecase(bullets);
      bullets.removeWhere((e) => _isOffScreen(e.position, size));
      enemies.removeWhere((e) => _isOffScreen(e.position, size));
      if (checkCollisionUseCase(player, enemies)) {
        _gameOver = true;
        onGameOver.call();
      }
      notifyListeners();
    });
  }

  bool _isOffScreen(Offset position, Size screenSize) {
    return position.dx < 0 ||
        position.dx > screenSize.width ||
        position.dy < 0 ||
        position.dy > screenSize.height;
  }

  void shootBullets() {
    bullets.add(
      shootBulletUsecase(position: player.position, direction: player.velocity),
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _gameLoopTimer?.cancel();
    _enemySpawnTimer?.cancel();
    _gameDurationTimer?.cancel();
    super.dispose();
  }
}
