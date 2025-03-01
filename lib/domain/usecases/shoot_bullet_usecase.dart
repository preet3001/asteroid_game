import 'dart:math';
import 'dart:ui';

import 'package:astroid_game/domain/entities/bullet.dart';

class ShootBulletUsecase {
  Bullet call({
    required Offset position,
    required Offset direction,
    double speed = 10,
  }) {
    double angle = atan2(direction.dy, direction.dx);
    Offset bulletVelocity = Offset(cos(angle), sin(angle)) * speed;
    return Bullet(position: position, velocity: bulletVelocity);
  }
}
