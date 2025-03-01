import 'package:astroid_game/domain/entities/player.dart';
import 'package:astroid_game/domain/usecases/update_position_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Update Position Use Case', () {
    test('should get updated position', () {
      final useCase = UpdatePositionUseCase();
      final Player ball = Player(
        position: Offset(100, 100),
        size: 10,
        velocity: Offset(100, 100),
      );
      final newPosition = Offset(200, 200);
      final updatedBall = useCase(ball, newPosition, 3);
      expect(updatedBall, isNot(same(ball))); // ensures immutability
    });
  });
}
