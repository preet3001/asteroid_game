import 'package:astroid_game/domain/entities/enemy.dart';
import 'package:astroid_game/domain/entities/player.dart';

class CheckCollisionUseCase {
  bool call(Player player, List<Enemy> enemies) {
    for (var enemy in enemies) {
      double distance = (player.position - enemy.position).distance;
      double collisionThreshold = player.size + enemy.size;
      if (distance <= collisionThreshold) {
        return true;
      }
    }
    return false;
  }
}
