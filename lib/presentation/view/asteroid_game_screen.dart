import 'package:astroid_game/presentation/view/widgets/game_over_dialog.dart';
import 'package:astroid_game/presentation/view/widgets/game_painter.dart';
import 'package:flutter/material.dart';
import '../view_model/asteroid_game_view_model.dart';

class AsteroidGameScreen extends StatefulWidget {
  const AsteroidGameScreen({super.key, required this.viewModel});
  final AsteroidGameViewModel viewModel;

  @override
  State<AsteroidGameScreen> createState() => _AsteroidGameScreenState();
}

class _AsteroidGameScreenState extends State<AsteroidGameScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startGame();
    });
    super.initState();
  }

  void startGame() {
    widget.viewModel.startGameLoop(
      count: 10,
      size: MediaQuery.sizeOf(context),
      onGameOver: onGameOver,
    );
  }

  void onGameOver() {
    showDialog(
      context: context,
      builder: (context) => GameOverDialog(onTryAgain: () => startGame()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) => widget.viewModel.onHover(event.localPosition),
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, _) {
            return CustomPaint(
              key: const Key("player_painter"),
              painter: GamePainter(
                enemies: widget.viewModel.enemies,
                player: widget.viewModel.player,
              ),
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}
