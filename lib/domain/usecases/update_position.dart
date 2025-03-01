import 'dart:ui';

import '../entities/ball.dart';

class UpdatePositionUseCase {
  Ball call(Ball ball, Offset newPostion) {
    return ball.copyWith(position: newPostion);
  }
}
