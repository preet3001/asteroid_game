import 'dart:ui';

import '../entities/player.dart';

class UpdatePositionUseCase {
  Player call(Player player, Offset newPostion, double speed) {
    Offset direction = (newPostion - player.position);

    if (direction.distance < speed) {
      return player.copyWith(position: newPostion); // Stop exactly at target
    }

    Offset movement = (direction / direction.distance) * speed;
    return player.copyWith(
      position: player.position + movement,
      velocity: movement,
    );
  }
}
