import 'dart:math';

import 'package:astroid_game/domain/entities/bullet.dart';
import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:astroid_game/domain/entities/player.dart';
import 'package:flutter/material.dart';

class GamePainter extends CustomPainter {
  GamePainter({
    required this.enemies,
    required this.player,
    required this.cursorPosition,
    required this.bullets,
  });
  final List<Enemy> enemies;
  final Player player;
  final Offset cursorPosition;
  final List<Bullet> bullets;
  @override
  void paint(Canvas canvas, Size size) {
    _drawPlayer(canvas, player.position, cursorPosition);
    _drawBullet(canvas);
    _drawEnemy(canvas);
  }

  void _drawBullet(Canvas canvas) {
    final bulletPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    for (var bullet in bullets) {
      canvas.drawCircle(
        bullet.position,
        bullet.size,
        bulletPaint,
      ); // Draw each enemy
    }
  }

  void _drawEnemy(Canvas canvas) {
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

  void _drawPlayer(Canvas canvas, Offset position, Offset velocity) {
    double angle = atan2(velocity.dy, velocity.dx); // Rotation angle

    Path cursor = Path();
    double size = player.size;

    // Define a more spaceship-like cursor
    cursor.moveTo(0, -size); // Tip of the triangle
    cursor.lineTo(size * 0.6, size); // Bottom right
    cursor.lineTo(0, size * 0.6); // Inner back
    cursor.lineTo(-size * 0.6, size); // Bottom left
    cursor.close();

    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(angle); // Rotate towards movement direction
    canvas.drawPath(
      cursor,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(GamePainter oldDelegate) {
    return oldDelegate.player != player || oldDelegate.enemies != enemies;
  }
}
