import 'dart:math';

import 'package:flutter/widgets.dart';

class Enemy {
  final Offset position;
  final Offset velocity;
  final double size;
  Path shape;
  Enemy({required this.position, required this.velocity, required this.size})
    : shape = _generateRandomPolygon(size);
  static Path _generateRandomPolygon(double size) {
    final Random random = Random();
    int sides = 5 + random.nextInt(4); // 5 to 8 sides
    List<Offset> points = [];

    for (int i = 0; i < sides; i++) {
      double angle = (2 * pi * i) / sides;
      double radius = size * (0.7 + random.nextDouble() * 0.6);
      points.add(Offset(cos(angle) * radius, sin(angle) * radius));
    }

    Path path = Path();
    path.addPolygon(points, true);
    return path;
  }

  Enemy move() {
    return Enemy(position: position + velocity, velocity: velocity, size: size)
      ..shape = shape;
  }
}
