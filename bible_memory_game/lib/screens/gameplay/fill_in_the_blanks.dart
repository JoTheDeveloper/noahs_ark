import 'package:bible_memory_game/screens/game_play_screen.dart';
import 'package:bible_memory_game/utils/enums.dart';
import 'package:flutter/material.dart';
import '../../widgets/colored_indicator.dart';

class FillInTheBlanksScreen extends StatefulWidget {
  final GameDifficulty? gameDifficulty;

  const FillInTheBlanksScreen({Key? key, @required this.gameDifficulty})
      : super(key: key);

  @override
  State<FillInTheBlanksScreen> createState() => _FillInTheBlanksScreenState();
}

class _FillInTheBlanksScreenState extends State<FillInTheBlanksScreen> {
  Map<String, bool?> progressMap = {
    'test 1': false,
    'test 2': true,
    'test 3': false,
    'test 4': null,
    'test 5': null,
    'test 6': null,
    'test 7': null,
    'test 8': null,
    'test 9': null,
    'test 10': null,
  };

  @override
  Widget build(BuildContext context) {
    return GamePlayScreen(
      child: Wrap(
        children: List.generate(progressMap.keys.length, (index) {
          return ColoredIndicator(
            success: progressMap.values.elementAt(index),
          );
        }),
      ),
      title: 'Fill in the blanks',
      subtitle: widget.gameDifficulty.toString().split('.')[1],
    );
  }
}
