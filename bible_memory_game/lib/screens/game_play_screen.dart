import 'package:bible_memory_game/widgets/filled_button.dart';
import 'package:bible_memory_game/widgets/transparent_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/themes.dart';
import '../widgets/game_play_heading.dart';

class GamePlayScreen extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? subtitle;
  final String? filledButtonText;
  final String? transparentButtonText;
  final Function()? transparentButtonOnTap;
  final Function()? filledButtonOnTap;

  const GamePlayScreen({
    Key? key,
    @required this.child,
    this.title,
    this.subtitle,
    this.filledButtonText,
    this.transparentButtonText,
    this.transparentButtonOnTap,
    this.filledButtonOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: MainTheme.backgroundBackdropColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: GamePlayHeading(
                  title: title,
                  subTitle: subtitle,
                ),
              ),
              Expanded(child: child ?? Container()),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                  bottom: 8.0,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filledButtonText != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: FilledButton(
                                text: filledButtonText,
                                onTap: filledButtonOnTap,
                              ),
                            )
                          : Container(),
                      transparentButtonText != null
                          ? TransparentButton(
                              text: transparentButtonText,
                              onTap: transparentButtonOnTap,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
