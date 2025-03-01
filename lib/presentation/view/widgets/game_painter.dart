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
    _drawPlayer(canvas, player.position, player.velocity);
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
    // Avoid division by zero when not moving
    double angle =
        velocity == Offset.zero ? 0 : atan2(velocity.dy, velocity.dx);

    double size = player.size;
    Path cursor = Path();

    // Define a spaceship-like shape
    cursor.moveTo(0, -size); // Tip of the spaceship
    cursor.lineTo(size * 0.6, size * 0.6); // Bottom right
    cursor.lineTo(0, size * 0.3); // Inner back
    cursor.lineTo(-size * 0.6, size * 0.6); // Bottom left
    cursor.close();

    // Move the canvas to the player position
    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(angle + pi / 2); // Rotate and align tip correctly
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
