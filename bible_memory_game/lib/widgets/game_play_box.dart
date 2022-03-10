import 'package:bible_memory_game/utils/themes.dart';
import 'package:flutter/material.dart';

class GamePlayBox extends StatelessWidget {
  final Widget? child;

  const GamePlayBox({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainTheme.backgroundGameplayBoxColor,
        border: Border.all(
          color: MainTheme.darkTextColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
