import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({super.key, required this.onTryAgain});
  final void Function() onTryAgain;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Game Over'),
      content: const Text('You collided with an enemy!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onTryAgain.call();
          },
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
