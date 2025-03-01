import 'package:astroid_game/presentation/view/widgets/player_painter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should repaint when position changed', () {
    final painter1 = PlayerPainter(const Offset(100, 100));
    final painter2 = PlayerPainter(const Offset(200, 200));
    expect(painter1.shouldRepaint(painter2), true);
    expect(painter1.shouldRepaint(painter1), false);
  });
}
