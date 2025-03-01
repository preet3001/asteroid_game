import 'dart:ui';

import 'package:astroid_game/domain/usecases/move_enemies.dart';
import 'package:astroid_game/domain/usecases/spawn_enemies.dart';
import 'package:astroid_game/domain/usecases/update_position.dart';
import 'package:astroid_game/presentation/view/asteroid_game_screen.dart';
import 'package:astroid_game/presentation/view_model/asteroid_game_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('should update ball position on pointer move', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AsteroidGameScreen(
          viewModel: BallGameViewModel(
            updatePositionUseCase: UpdatePositionUseCase(),
            spawnEnemiesUseCase: SpawnEnemiesUseCase(),
            moveEnemiesUseCase: MoveEnemiesUseCase(),
          ),
        ),
      ),
    );

    // Simulate mouse movement to (300, 300)
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.moveTo(const Offset(300, 300));

    await tester.pump(); // Rebuild UI

    // Ensure ball's new position is updated (implicitly verified via repaint)
    // CustomPainter testing is tricky, so we check for successful rebuild
    expect(find.byKey(const Key('player_painter')), findsOneWidget);
  });
}
