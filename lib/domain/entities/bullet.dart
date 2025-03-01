import 'dart:ui';

class Bullet {
  final Offset position;
  final Offset velocity;
  final double size;

  Bullet({required this.position, required this.velocity, this.size = 5});

  Bullet move() {
    return Bullet(
      position: position + velocity,
      velocity: velocity,
      size: size,
    );
  }
}
