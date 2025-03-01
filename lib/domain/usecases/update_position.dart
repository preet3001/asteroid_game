import 'dart:ui';

import '../entities/player.dart';

class UpdatePositionUseCase {
  Player call(Player ball, Offset newPostion) {
    return ball.copyWith(position: newPostion);
  }
}
