import 'package:flutter/widgets.dart';

class Player {
  final Offset position;
  final double size;
  final Offset velocity;
  Player({required this.position, required this.size, required this.velocity});

  Player copyWith({Offset? position, double? size, Offset? velocity}) => Player(
    position: position ?? this.position,
    size: size ?? this.size,
    velocity: velocity ?? this.velocity,
  );
}
