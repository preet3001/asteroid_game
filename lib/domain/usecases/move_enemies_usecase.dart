import '../entities/enemy.dart';

class MoveEnemiesUseCase {
  /// Moves each enemy based on its velocity
  List<Enemy> call(List<Enemy> enemies) {
    return enemies.map((enemy) => enemy.move()).toList();
  }
}
