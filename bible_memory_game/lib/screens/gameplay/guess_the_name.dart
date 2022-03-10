import 'package:bible_memory_game/models/bible_character_model.dart';
import 'package:bible_memory_game/utils/enums.dart';
import 'package:flutter/material.dart';
import '../../data_sources/game_data.dart';
import '../../utils/themes.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/game_play_box.dart';
import '../game_play_screen.dart';
import '../../widgets/colored_indicator.dart';

class GuessTheNameGamePlayScreen extends StatefulWidget {
  final TestamentMode? testamentMode;

  const GuessTheNameGamePlayScreen({Key? key, @required this.testamentMode})
      : super(key: key);

  @override
  State<GuessTheNameGamePlayScreen> createState() =>
      _GuessTheNameGamePlayScreenState();
}

class _GuessTheNameGamePlayScreenState
    extends State<GuessTheNameGamePlayScreen> {
  Map<BibleCharacter, bool?> progressMap = {};
  int position = 0;
  int transitionCount = 0;
  bool gameFinished = false;
  String resultText = '';
  TextEditingController nameFieldController = TextEditingController();

  @override
  void initState() {
    progressMap = new Map.fromIterables(
      getVersesFromTestamentMode(),
      [for (var i = 0; i < getVersesFromTestamentMode().length; i += 1) null],
    );
    super.initState();
  }

  @override
  void dispose() {
    progressMap = {};
    position = 0;
    transitionCount = 0;
    gameFinished = false;
    resultText = '';
    nameFieldController = TextEditingController();
    super.dispose();
  }

  List<BibleCharacter> getVersesFromTestamentMode() {
    List<BibleCharacter> verses = [];
    switch (widget.testamentMode) {
      case TestamentMode.OldTestament:
        verses = GameDataStore()
            .bibleCharacters
            .where((character) =>
                character.testamentMode == TestamentMode.OldTestament)
            .toList();
        break;
      case TestamentMode.NewTestament:
        verses = GameDataStore()
            .bibleCharacters
            .where((character) =>
                character.testamentMode == TestamentMode.NewTestament)
            .toList();
        break;
      case TestamentMode.EntireBible:
        verses = GameDataStore().bibleCharacters;
        break;
      case null:
        break;
    }
    return verses;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GamePlayScreen(
        title: 'Guess the Verse',
        subtitle: widget.testamentMode.toString().split('.')[1],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: List.generate(progressMap.keys.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ColoredIndicator(
                      success: progressMap.values.elementAt(index),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: GamePlayBox(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Container(
                      key: Key(transitionCount.toString()),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildGameplayContent(),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        filledButtonText: gameFinished ? 'New Game' : 'Next',
        filledButtonOnTap: () => gameFinished
            ? Navigator.pop(context)
            : setState(() => nextQuestion()),
        transparentButtonText: gameFinished ? null : "Quit",
        transparentButtonOnTap: () => Navigator.pop(context),
      ),
    );
  }

  void getGameResult() {
    transitionCount += 1;
    resultText = 'Score: '
        '${progressMap.values.where((e) => e == true).length} '
        'out of ${progressMap.length}';
    gameFinished = true;
  }

  void nextQuestion() {
    progressMap.update(
      progressMap.keys.elementAt(position),
      (value) => checkAndClearAnswerFields(),
    );

    position < progressMap.length - 1 ? position += 1 : getGameResult();
  }

  Widget _buildGameplayContent() {
    return gameFinished
        ? Container(
            child: Center(
              child: Text(
                resultText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${progressMap.keys.elementAt(position).description}',
                style: TextStyle(
                  color: MainTheme.lightTextColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
              CustomTextField(
                labelText: 'Name',
                textEditingController: nameFieldController,
              ),
            ],
          );
  }

  bool checkAndClearAnswerFields() {
    bool result;
    result = lowercaseRemoveSpaces(progressMap.keys.elementAt(position).name) ==
        lowercaseRemoveSpaces(nameFieldController.text);
    nameFieldController.clear();
    return result;
  }

  String lowercaseRemoveSpaces(String? text) {
    text = text?.toLowerCase();
    text = text?.replaceAll(' ', '');
    return text ?? '';
  }
}
