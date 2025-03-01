import 'dart:math';

import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:flutter/widgets.dart';

class SpawnEnemiesUseCase {
  final _random = Random();
  List<Enemy> call(int count, Size screenSize) {
    return List.generate(count, (_) {
      return Enemy(
        position: Offset(
          _random.nextDouble() * screenSize.width,
          _random.nextDouble() * screenSize.height,
        ),
        velocity: Offset(
          (_random.nextDouble() - 0.5) * 4, //random speed between -2 and 2
          (_random.nextDouble() - 0.5) * 4,
        ),
      );
    });
  }
}
