import 'package:astroid_game/domain/entities/bullet.dart';

class MoveBulletsUsecase {
  List<Bullet> call(List<Bullet> bullets) {
    return bullets.map((e) => e.move()).toList();
  }
}
