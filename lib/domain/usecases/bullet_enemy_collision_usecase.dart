import 'package:astroid_game/core/usecases/collision_usecase.dart';
import 'package:astroid_game/domain/entities/bullet.dart';
import 'package:astroid_game/domain/entities/enemy.dart';

class BulletEnemyCollisionUseCase
    extends CollisionUseCase<List<Bullet>, List<Enemy>, List<Enemy>> {
  @override
  List<Enemy> call(List<Bullet> bullets, List<Enemy> enemies) {
    return enemies.where((enemy) {
      bool isHit = bullets.any(
        (bullet) => (enemy.position - bullet.position).distance < enemy.size,
      );
      return !isHit; // Keep only non-collided enemies
    }).toList();
  }
}
