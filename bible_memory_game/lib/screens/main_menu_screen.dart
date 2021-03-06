import 'package:bible_memory_game/screens/gameplay/fill_in_the_blanks.dart';
import 'package:bible_memory_game/screens/gameplay/guess_the_name.dart';
import 'package:bible_memory_game/screens/gameplay/guess_the_verse.dart';
import 'package:bible_memory_game/utils/themes.dart';
import 'package:bible_memory_game/widgets/app_background.dart';
import 'package:bible_memory_game/widgets/main_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/enums.dart';
import '../widgets/filled_button.dart';
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
  int transitionCount = 0;

  @override
  void initState() {
    visibleMenuItems = _buildMainMenu();
    visibleBottomIcons = _buildMainMenuBottomIcons();
    super.initState();
  }

  @override
  void dispose() {
    visibleMenuItems = Container();
    visibleBottomIcons = Container();
    transitionCount = 0;
    super.dispose();
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
                      key: Key(transitionCount.toString()),
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
                    key: Key(transitionCount.toString()),
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
            transitionCount += 1;
            visibleMenuItems = _buildMemoryGameDifficultyMenu();
            visibleBottomIcons = _buildSubMenuBottomIcons();
          }),
        ),
        MainMenuButton(
          Key('Fill in the Blanks'),
          'Fill in the Blanks',
          () => setState(() {
            transitionCount += 1;
            visibleMenuItems = _buildFillInBlanksDifficultyMenu();
            visibleBottomIcons = _buildSubMenuBottomIcons();
          }),
        ),
        MainMenuButton(
          Key('Guess the Verse'),
          'Guess the Verse',
          () => setState(() {
            transitionCount += 1;
            visibleMenuItems = _buildGuessTheVerseGameModes();
            visibleBottomIcons = _buildSubMenuBottomIcons();
          }),
        ),
        MainMenuButton(
          Key('Guess the Name'),
          'Guess the Name',
          () => setState(() {
            transitionCount += 1;
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
                testamentMode: TestamentMode.OldTestament,
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
                testamentMode: TestamentMode.NewTestament,
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
                testamentMode: TestamentMode.EntireBible,
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
                testamentMode: TestamentMode.OldTestament,
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
                testamentMode: TestamentMode.NewTestament,
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
                testamentMode: TestamentMode.EntireBible,
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
        transitionCount += 1;
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
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => _buildPopUp(
              'About Us',
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Image.asset(
                        "assets/images/cross_platform_logo.png",
                      ),
                    ),
                    Text(
                      'We???ve been striving to create a platform where Christians can learn more about the word of God. '
                      '\n\nNoah???s Ark is one of our learning tools. '
                      '\n\nIf you would like to help us in our mission, click the link below.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: RadiantGradientMask(
            Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => _buildPopUp(
              'Settings',
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  children: [
                    _buildSettingControl("Music"),
                    _buildSettingControl("Sound Effects"),
                    _buildSettingControl("Vibrations"),
                  ],
                ),
              ),
            ),
          ),
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

  Widget _buildSettingControl(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Switch(
          value: true,
          activeColor: MainTheme.darkTextColor,
          onChanged: (bool value) {
            // service.enableSetting(site, setting.id, value);
          },
        )
      ],
    );
  }

  Widget _buildPopUp(String title, Widget content) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.cinzel(
          textStyle: TextStyle(
            color: MainTheme.lightTextColor,
            fontSize: 24,
          ),
        ),
      ),
      content: content,
      backgroundColor: MainTheme.backgroundBackdropColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: MainTheme.alertDialogBorderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            bottom: 16.0,
          ),
          child: FilledButton(
            text: 'close',
            onTap: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
