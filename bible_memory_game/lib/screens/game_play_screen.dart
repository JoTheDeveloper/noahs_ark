import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/themes.dart';
import '../widgets/game_play_heading.dart';

class GamePlayScreen extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? subtitle;

  const GamePlayScreen(
      {Key? key, @required this.child, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
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
                title: title,
                subTitle: subtitle,
              ),
            ),
            child ?? Container(),
          ],
        ),
      ),
    );
    ;
  }
}
