import 'package:flutter/widgets.dart';

class Player {
  final Offset position;
  final double size;
  Player({required this.position, required this.size});

  Player copyWith({Offset? position, double? size}) =>
      Player(position: position ?? this.position, size: size ?? this.size);
}
