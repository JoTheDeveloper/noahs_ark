import 'package:bible_memory_game/data_sources/game_data.dart';
import 'package:bible_memory_game/models/bible_verse_model.dart';
import 'package:bible_memory_game/utils/themes.dart';
import 'package:bible_memory_game/widgets/colored_indicator.dart';
import 'package:bible_memory_game/widgets/custom_text_field.dart';
import 'package:bible_memory_game/widgets/game_play_box.dart';
import 'package:flutter/material.dart';
import '../../utils/enums.dart';
import '../game_play_screen.dart';

class GuessTheVerseGamePlayScreen extends StatefulWidget {
  final TestamentMode? testamentMode;

  const GuessTheVerseGamePlayScreen({Key? key, @required this.testamentMode})
      : super(key: key);

  @override
  State<GuessTheVerseGamePlayScreen> createState() =>
      _GuessTheVerseGamePlayScreenState();
}

class _GuessTheVerseGamePlayScreenState
    extends State<GuessTheVerseGamePlayScreen> {
  Map<BibleVerse, bool?> progressMap = {};
  int position = 0;
  int transitionCount = 0;
  bool gameFinished = false;
  String resultText = '';
  TextEditingController bookFieldController = TextEditingController();
  TextEditingController chapterFieldController = TextEditingController();
  TextEditingController verseFieldController = TextEditingController();

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
    bookFieldController = TextEditingController();
    chapterFieldController = TextEditingController();
    verseFieldController = TextEditingController();
    super.dispose();
  }

  List<BibleVerse> getVersesFromTestamentMode() {
    List<BibleVerse> verses = [];
    switch (widget.testamentMode) {
      case TestamentMode.OldTestament:
        verses = GameDataStore()
            .bibleVerses
            .where((verse) => verse.testamentMode == TestamentMode.OldTestament)
            .toList();
        break;
      case TestamentMode.NewTestament:
        verses = GameDataStore()
            .bibleVerses
            .where((verse) => verse.testamentMode == TestamentMode.NewTestament)
            .toList();
        break;
      case TestamentMode.EntireBible:
        verses = GameDataStore().bibleVerses;
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
        filledButtonText: gameFinished ? 'Play again' : 'Next',
        filledButtonOnTap: () => setState(() {
          gameFinished
              ? Navigator.pop(context)
              : setState(() => goToNextQuestion());
        }),
        transparentButtonText: gameFinished ? null : "Quit",
        transparentButtonOnTap: () => Navigator.pop(context),
      ),
    );
  }

  void getGameResult() {
    transitionCount += 1;
    resultText = 'You score was '
        '${progressMap.values.where((e) => e == true).length} '
        'out of ${progressMap.length}';
    gameFinished = true;
  }

  void goToNextQuestion() {
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
                '"${progressMap.keys.elementAt(position).text}"',
                style: TextStyle(
                  color: MainTheme.lightTextColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
              CustomTextField(
                labelText: 'Book',
                textEditingController: bookFieldController,
              ),
              CustomTextField(
                labelText: 'Chapter',
                textEditingController: chapterFieldController,
              ),
              CustomTextField(
                labelText: 'Verse',
                textEditingController: verseFieldController,
              ),
            ],
          );
  }

  bool checkAndClearAnswerFields() {
    bool result;
    result = lowercaseRemoveSpaces(progressMap.keys.elementAt(position).book) ==
            lowercaseRemoveSpaces(bookFieldController.text) &&
        lowercaseRemoveSpaces(progressMap.keys.elementAt(position).chapter) ==
            lowercaseRemoveSpaces(chapterFieldController.text) &&
        lowercaseRemoveSpaces(progressMap.keys.elementAt(position).verse) ==
            lowercaseRemoveSpaces(verseFieldController.text);
    bookFieldController.clear();
    chapterFieldController.clear();
    verseFieldController.clear();
    return result;
  }

  String lowercaseRemoveSpaces(String? text) {
    text = text?.toLowerCase();
    text = text?.replaceAll(' ', '');
    return text ?? '';
  }
}
