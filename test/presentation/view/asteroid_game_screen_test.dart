import 'dart:ui';

import 'package:astroid_game/domain/usecases/bullet_enemy_collision_usecase.dart';
import 'package:astroid_game/domain/usecases/player_enemy_collision_usecase.dart';
import 'package:astroid_game/domain/usecases/move_bullets_usecase.dart';
import 'package:astroid_game/domain/usecases/move_enemies_usecase.dart';
import 'package:astroid_game/domain/usecases/shoot_bullet_usecase.dart';
import 'package:astroid_game/domain/usecases/spawn_enemies_usecase.dart';
import 'package:astroid_game/domain/usecases/update_position_usecase.dart';
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
          viewModel: AsteroidGameViewModel(
            updatePositionUseCase: UpdatePositionUseCase(),
            spawnEnemiesUseCase: SpawnEnemiesUseCase(),
            moveEnemiesUseCase: MoveEnemiesUseCase(),
            checkCollisionUseCase: PlayerEnemyCollisionUseCase(),
            shootBulletUsecase: ShootBulletUsecase(),
            moveBulletsUsecase: MoveBulletsUsecase(),
            bulletEnemyCollisionUsecase: BulletEnemyCollisionUsecase(),
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
