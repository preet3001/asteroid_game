import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:flutter/material.dart';

class EnemyPainter extends CustomPainter {
  final List<Enemy> enemies;

  EnemyPainter(this.enemies);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill;

    for (var enemy in enemies) {
      canvas.drawCircle(enemy.position, 10, paint); // Draw each enemy
    }
  }

  @override
  bool shouldRepaint(covariant EnemyPainter oldDelegate) {
    return oldDelegate.enemies != enemies;
  }
}
