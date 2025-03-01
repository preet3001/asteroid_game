import 'package:flutter/widgets.dart';

class Ball {
  final Offset position;
  Ball({required this.position});

  Ball copyWith({Offset? position}) =>
      Ball(position: position ?? this.position);
}
