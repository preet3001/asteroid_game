import 'package:flutter/widgets.dart';

class Enemy {
  final Offset position;
  final Offset velocity;
  final double size;
  Enemy({required this.position, required this.velocity, required this.size});

  Enemy move() {
    return Enemy(position: position + velocity, velocity: velocity, size: size);
  }
}
