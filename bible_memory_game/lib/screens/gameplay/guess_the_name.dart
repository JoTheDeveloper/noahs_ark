import 'package:flutter/material.dart';
import '../game_play_screen.dart';
import '../../utils/enums.dart';
import '../../widgets/colored_indicator.dart';

class GuessTheNameGamePlayScreen extends StatefulWidget {
  final GameMode? gameMode;

  const GuessTheNameGamePlayScreen({Key? key, @required this.gameMode})
      : super(key: key);

  @override
  State<GuessTheNameGamePlayScreen> createState() =>
      _GuessTheNameGamePlayScreenState();
}

class _GuessTheNameGamePlayScreenState
    extends State<GuessTheNameGamePlayScreen> {
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
      title: 'Guess the Name',
      subtitle: widget.gameMode.toString().split('.')[1],
    );
  }
}
