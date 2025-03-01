import 'package:astroid_game/core/usecases/collision_usecase.dart';
import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:astroid_game/domain/entities/player.dart';

class PlayerEnemyCollisionUseCase
    extends CollisionUseCase<Player, List<Enemy>, bool> {
  @override
  bool call(Player player, List<Enemy> enemies) {
    for (var enemy in enemies) {
      double distance = (player.position - enemy.position).distance;
      double collisionThreshold = player.size + enemy.size;
      if (distance <= collisionThreshold) {
        return true; // Collision detected
      }
    }
    return false; // No collision
  }
}
