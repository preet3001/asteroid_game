import 'package:astroid_game/domain/usecases/bullet_enemy_collision_usecase.dart';
import 'package:astroid_game/domain/usecases/check_collision_usecase.dart';
import 'package:astroid_game/domain/usecases/move_bullets_usecase.dart';
import 'package:astroid_game/domain/usecases/move_enemies_usecase.dart';
import 'package:astroid_game/domain/usecases/shoot_bullet_usecase.dart';
import 'package:astroid_game/domain/usecases/spawn_enemies_usecase.dart';
import 'package:astroid_game/domain/usecases/update_position_usecase.dart';
import 'package:astroid_game/presentation/view_model/asteroid_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:astroid_game/presentation/view/asteroid_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
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
    );
  }
}
