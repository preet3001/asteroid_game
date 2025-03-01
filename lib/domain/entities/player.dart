import 'package:flutter/widgets.dart';

class Player {
  final Offset position;
  Player({required this.position});

  Player copyWith({Offset? position}) =>
      Player(position: position ?? this.position);
}
