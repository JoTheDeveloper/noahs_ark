import 'package:bible_memory_game/utils/enums.dart';
import 'package:flutter/material.dart';

import '../../utils/themes.dart';
import '../../widgets/colored_indicator.dart';
import '../../widgets/game_play_heading.dart';

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
                title: 'Fill in the blanks',
                subTitle: widget.gameDifficulty.toString().split('.')[1],
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
