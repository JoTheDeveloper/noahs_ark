import 'package:bible_memory_game/widgets/colored_indicator.dart';
import 'package:bible_memory_game/widgets/game_play_heading.dart';
import 'package:flutter/material.dart';

import '../../utils/enums.dart';
import '../../utils/themes.dart';

class GuessTheVerseGamePlayScreen extends StatefulWidget {
  final GameMode? gameMode;

  const GuessTheVerseGamePlayScreen({Key? key, @required this.gameMode})
      : super(key: key);

  @override
  State<GuessTheVerseGamePlayScreen> createState() =>
      _GuessTheVerseGamePlayScreenState();
}

class _GuessTheVerseGamePlayScreenState
    extends State<GuessTheVerseGamePlayScreen> {
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
                title: 'Guess The Verse',
                subTitle: widget.gameMode.toString().split('.')[1],
              ),
            ),
            Wrap(
              children: List.generate(progressMap.keys.length, (index) {
                return ColoredIndicator(
                  success: progressMap.values.elementAt(index),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
