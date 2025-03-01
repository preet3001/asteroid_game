import 'dart:async';

import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:astroid_game/domain/usecases/move_enemies.dart';
import 'package:astroid_game/domain/usecases/spawn_enemies.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/player.dart';
import '../../domain/usecases/update_position.dart';

class BallGameViewModel extends ChangeNotifier {
  BallGameViewModel({
    required this.updatePositionUseCase,
    required this.spawnEnemiesUseCase,
    required this.moveEnemiesUseCase,
  });
  final UpdatePositionUseCase updatePositionUseCase;
  final MoveEnemiesUseCase moveEnemiesUseCase;
  final SpawnEnemiesUseCase spawnEnemiesUseCase;

  Timer? _timer;

  Player player = Player(position: Offset(200, 200));
  void onHover(Offset newOffset) {
    player = updatePositionUseCase(player, newOffset);
    notifyListeners();
  }

  List<Enemy> enemies = [];

  void spawnAndMoveEnemies(count, Size size) {
    enemies = spawnEnemiesUseCase(count, size);
    notifyListeners();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      enemies = moveEnemiesUseCase(enemies);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
