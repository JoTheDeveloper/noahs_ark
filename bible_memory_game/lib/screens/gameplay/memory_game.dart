import 'package:bible_memory_game/utils/enums.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: MainTheme.backgroundBackdropColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: GamePlayHeading(
                title: 'Memory Game',
                subTitle: widget.gameDifficulty.toString().split('.')[1],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
