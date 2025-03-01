import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:astroid_game/domain/entities/player.dart';
import 'package:flutter/material.dart';

class GamePainter extends CustomPainter {
  GamePainter({required this.enemies, required this.player});
  final List<Enemy> enemies;

  final Player player;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    canvas.drawCircle(player.position, player.size, paint);

    final enemyPaint =
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill;

    for (var enemy in enemies) {
      canvas.drawCircle(
        enemy.position,
        enemy.size,
        enemyPaint,
      ); // Draw each enemy
    }
  }

  @override
  bool shouldRepaint(GamePainter oldDelegate) {
    return oldDelegate.player != player || oldDelegate.enemies != enemies;
  }
}
