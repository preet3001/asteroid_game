import 'package:astroid_game/domain/entities/bullet.dart';
import 'package:astroid_game/domain/entities/enemy.dart';

class BulletEnemyCollisionUsecase {
  List<Enemy> call({
    required List<Bullet> bullets,
    required List<Enemy> enemies,
  }) {
    return enemies.where((enemy) {
      bool isHit = bullets.any(
        (bullet) => (enemy.position - bullet.position).distance < enemy.size,
      );
      return !isHit; // Keep only non-collided enemies
    }).toList();
  }
}
