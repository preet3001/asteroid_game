import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:flutter/material.dart';

class GamePainter extends CustomPainter {
  GamePainter({required this.enemies, required this.playerPosition});
  final List<Enemy> enemies;

  final Offset playerPosition;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    canvas.drawCircle(playerPosition, 20, paint);

    final enemyPaint =
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill;

    for (var enemy in enemies) {
      canvas.drawCircle(enemy.position, 10, enemyPaint); // Draw each enemy
    }
  }

  @override
  bool shouldRepaint(GamePainter oldDelegate) {
    return oldDelegate.playerPosition != playerPosition ||
        oldDelegate.enemies != enemies;
  }
}
