import 'dart:math';

import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:flutter/widgets.dart';

class SpawnEnemiesUseCase {
  final _random = Random();
  Enemy call(Size screenSize) {
    double x, y;

    // Randomly choose an edge (0: top, 1: bottom, 2: left, 3: right)
    int edge = _random.nextInt(4);

    switch (edge) {
      case 0: // Top edge
        x = _random.nextDouble() * screenSize.width;
        y = 0;
        break;
      case 1: // Bottom edge
        x = _random.nextDouble() * screenSize.width;
        y = screenSize.height;
        break;
      case 2: // Left edge
        x = 0;
        y = _random.nextDouble() * screenSize.height;
        break;
      case 3: // Right edge
        x = screenSize.width;
        y = _random.nextDouble() * screenSize.height;
        break;
      default:
        x = 0;
        y = 0;
    }
    Offset spawnPosition = Offset(x, y);
    Offset center = Offset(screenSize.width / 2, screenSize.height / 2);
    Offset direction = center - spawnPosition;

    // Normalize the direction vector
    double distance = direction.distance;
    Offset velocity = distance > 0 ? (direction / distance) * 2 : Offset.zero;
    return Enemy(
      position: spawnPosition,
      size: _random.nextDouble() * 30 + 10, // Variable size (10-40)
      velocity: velocity, // Moves toward the center
    );
  }
}
