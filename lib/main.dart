import 'package:astroid_game/domain/usecases/update_position.dart';
import 'package:astroid_game/presentation/view_model/asteroid_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:astroid_game/presentation/view/asteroid_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: AsteroidGameScreen(
        viewModel: BallGameViewModel(UpdatePositionUseCase()),
      ),
    );
  }
}
