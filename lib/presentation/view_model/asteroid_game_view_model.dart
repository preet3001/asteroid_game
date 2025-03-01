import 'package:flutter/material.dart';
import '../../domain/entities/ball.dart';
import '../../domain/usecases/update_position.dart';

class BallGameViewModel extends ChangeNotifier {
  BallGameViewModel(this.updatePositionUseCase);
  final UpdatePositionUseCase updatePositionUseCase;
  Ball ball = Ball(position: Offset(200, 200));
  void onHover(Offset newOffset) {
    ball = updatePositionUseCase(ball, newOffset);
    notifyListeners();
  }
}
