import 'package:astroid_game/presentation/view/widgets/player_painter.dart';
import 'package:flutter/material.dart';
import '../view_model/asteroid_game_view_model.dart';

class BallGameScreen extends StatefulWidget {
  const BallGameScreen({super.key, required this.viewModel});
  final BallGameViewModel viewModel;

  @override
  State<BallGameScreen> createState() => _BallGameScreenState();
}

class _BallGameScreenState extends State<BallGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) => widget.viewModel.onHover(event.localPosition),
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, _) {
            return CustomPaint(
              painter: PlayerPainter(widget.viewModel.ball.position),
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}
