import 'package:flutter/material.dart';

class PlayerPainter extends CustomPainter {
  final Offset position;
  PlayerPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 20, paint);
  }

  @override
  bool shouldRepaint(PlayerPainter oldDelegate) {
    return oldDelegate.position != position;
  }
}
