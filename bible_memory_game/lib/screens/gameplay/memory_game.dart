import 'package:bible_memory_game/data_sources/game_data.dart';
import 'package:bible_memory_game/utils/enums.dart';
import 'package:bible_memory_game/utils/themes.dart';
import 'package:bible_memory_game/widgets/game_play_box.dart';
import 'package:flutter/material.dart';
import '../game_play_screen.dart';

class MemoryGameScreen extends StatefulWidget {
  final GameDifficulty? gameDifficulty;

  const MemoryGameScreen({Key? key, @required this.gameDifficulty})
      : super(key: key);

  @override
  State<MemoryGameScreen> createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  List<String> visibleTileImages = [];
  final String hiddenCardPath = "assets/images/wood_pallet_background.jpg";
  List<String> randomizedList = [];
  final int cardCount = GameDataStore().symbolImagesList.length;
  List<Map<int, String>> matchCheck = [];
  int attempts = 0;
  bool gameFinished = false;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    randomizedList = GameDataStore().getShuffledImages();
    visibleTileImages = List.generate(cardCount, (index) => hiddenCardPath);
    attempts = getAttemptsFromGameDifficulty();
    matchCheck = [];
    gameFinished = false;
  }

  int getAttemptsFromGameDifficulty() {
    int attempts = 0;
    switch (widget.gameDifficulty) {
      case GameDifficulty.Beginner:
        attempts = 40;
        break;
      case GameDifficulty.Pro:
        attempts = 30;
        break;
      case GameDifficulty.Expert:
        attempts = 20;
        break;
      case null:
        break;
    }
    return attempts;
  }

  @override
  Widget build(BuildContext context) {
    return GamePlayScreen(
      title: 'Memory Game',
      subtitle: widget.gameDifficulty.toString().split('.')[1],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GamePlayBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Attempts left: $attempts',
                  style: TextStyle(
                    color: attempts == 0 ? Colors.red : Colors.white,
                    fontSize: 20,
                    fontWeight:
                        attempts == 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                child: _buildGameplayBody(),
              )
            ],
          ),
        ),
      ),
      filledButtonText: 'New Game',
      filledButtonOnTap: () => setState(() => resetGame()),
      transparentButtonText: "Quit",
      transparentButtonOnTap: () => Navigator.pop(context),
    );
  }

  Widget _buildGameplayBody() {
    return gameFinished
        ? Container()
        : GridView.builder(
            itemCount: visibleTileImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (visibleTileImages[index] == hiddenCardPath &&
                        attempts > 0 &&
                        matchCheck.length < 2) {
                      selectChoice(index);
                      if (matchCheck.length == 2) {
                        attempts--;
                        matchCheck[0].values.first == matchCheck[1].values.first
                            ? matchCheck.clear()
                            : clearChoices();
                      }
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    gradient: MainTheme.mainButtonGradient,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(visibleTileImages[index]),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            });
  }

  void clearChoices() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        visibleTileImages[matchCheck[0].keys.first] = hiddenCardPath;
        visibleTileImages[matchCheck[1].keys.first] = hiddenCardPath;
        matchCheck.clear();
      });
    });
  }

  void selectChoice(int index) {
    visibleTileImages[index] = randomizedList[index];
    matchCheck.add({index: randomizedList[index]});
  }
}
