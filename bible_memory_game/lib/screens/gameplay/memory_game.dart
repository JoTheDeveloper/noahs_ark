import 'package:bible_memory_game/utils/enums.dart';
import 'package:flutter/material.dart';

import '../game_play_screen.dart';
import '../../utils/themes.dart';
import '../../widgets/game_play_heading.dart';

class MemoryGameScreen extends StatefulWidget {
  final GameDifficulty? gameDifficulty;

  const MemoryGameScreen({Key? key, @required this.gameDifficulty})
      : super(key: key);

  @override
  State<MemoryGameScreen> createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  @override
  Widget build(BuildContext context) {
    return GamePlayScreen(
      child: null,
      title: 'Memory Game',
      subtitle: widget.gameDifficulty.toString().split('.')[1],
    );
  }
}
