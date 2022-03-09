import 'package:bible_memory_game/screens/gameplay/fill_in_the_blanks.dart';
import 'package:bible_memory_game/screens/gameplay/guess_the_name.dart';
import 'package:bible_memory_game/screens/gameplay/guess_the_verse.dart';
import 'package:bible_memory_game/utils/themes.dart';
import 'package:bible_memory_game/widgets/app_background.dart';
import 'package:bible_memory_game/widgets/main_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/enums.dart';
import '../widgets/gradient_icon.dart';
import 'gameplay/memory_game.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  Widget visibleMenuItems = Container();
  Widget visibleBottomIcons = Container();
  int count = 0;

  @override
  void initState() {
    visibleMenuItems = _buildMainMenu();
    visibleBottomIcons = _buildMainMenuBottomIcons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: MainTheme.backgroundBackdropColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/images/app_logo.png"),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Container(
                      key: Key(count.toString()),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: visibleMenuItems,
                      ),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Container(
                    key: Key(count.toString()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: visibleBottomIcons,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        menuTitle('Choose a game:'),
        MainMenuButton(
          Key('Memory Game'),
          'Memory Game',
          () => setState(() {
            count += 1;
            visibleMenuItems = _buildMemoryGameDifficultyMenu();
            visibleBottomIcons = _buildSubMenuBottomIcons();
          }),
        ),
        MainMenuButton(
          Key('Fill in the Blanks'),
          'Fill in the Blanks',
          () => setState(() {
            count += 1;
            visibleMenuItems = _buildFillInBlanksDifficultyMenu();
            visibleBottomIcons = _buildSubMenuBottomIcons();
          }),
        ),
        MainMenuButton(
          Key('Guess the Verse'),
          'Guess the Verse',
          () => setState(() {
            count += 1;
            visibleMenuItems = _buildGuessTheVerseGameModes();
            visibleBottomIcons = _buildSubMenuBottomIcons();
          }),
        ),
        MainMenuButton(
          Key('Guess the Name'),
          'Guess the Name',
          () => setState(() {
            count += 1;
            visibleMenuItems = _buildGuessTheNameGameModes();
            visibleBottomIcons = _buildSubMenuBottomIcons();
          }),
        ),
      ],
    );
  }

  Widget menuTitle(String text) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: MainTheme.lightTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGuessTheVerseGameModes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        menuTitle('Choose your game mode:'),
        MainMenuButton(
          Key('Old Testament'),
          'Old Testament',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return GuessTheVerseGamePlayScreen(
                gameMode: GameMode.OldTestament,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('New Testament'),
          'New Testament',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return GuessTheVerseGamePlayScreen(
                gameMode: GameMode.NewTestament,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('Entire Bible'),
          'Entire Bible',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return GuessTheVerseGamePlayScreen(
                gameMode: GameMode.EntireBible,
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildGuessTheNameGameModes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        menuTitle('Choose your game mode:'),
        MainMenuButton(
          Key('Old Testament'),
          'Old Testament',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return GuessTheNameGamePlayScreen(
                gameMode: GameMode.OldTestament,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('New Testament'),
          'New Testament',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return GuessTheNameGamePlayScreen(
                gameMode: GameMode.NewTestament,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('Entire Bible'),
          'Entire Bible',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return GuessTheNameGamePlayScreen(
                gameMode: GameMode.EntireBible,
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildFillInBlanksDifficultyMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        menuTitle('Choose your difficulty:'),
        MainMenuButton(
          Key('Beginner'),
          'Beginner',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return FillInTheBlanksScreen(
                gameDifficulty: GameDifficulty.Beginner,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('Pro'),
          'Pro',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return FillInTheBlanksScreen(
                gameDifficulty: GameDifficulty.Pro,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('Expert'),
          'Expert',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return FillInTheBlanksScreen(
                gameDifficulty: GameDifficulty.Expert,
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildMemoryGameDifficultyMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        menuTitle('Choose your difficulty:'),
        MainMenuButton(
          Key('Beginner'),
          'Beginner',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return MemoryGameScreen(
                gameDifficulty: GameDifficulty.Beginner,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('Pro'),
          'Pro',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return MemoryGameScreen(
                gameDifficulty: GameDifficulty.Pro,
              );
            }),
          ),
        ),
        MainMenuButton(
          Key('Expert'),
          'Expert',
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return MemoryGameScreen(
                gameDifficulty: GameDifficulty.Expert,
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSubMenuBottomIcons() {
    return InkWell(
      onTap: () => setState(() {
        count += 1;
        visibleMenuItems = _buildMainMenu();
        visibleBottomIcons = _buildMainMenuBottomIcons();
      }),
      child: RadiantGradientMask(
        Icon(
          Icons.arrow_back_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMainMenuBottomIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: RadiantGradientMask(
            Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: RadiantGradientMask(
            Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
