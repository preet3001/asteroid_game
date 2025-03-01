import 'package:flutter/widgets.dart';

class Enemy {
  final Offset position;
  final Offset velocity;
  Enemy({required this.position, required this.velocity});

  Enemy move() {
    return Enemy(position: position + velocity, velocity: velocity);
  }
}
