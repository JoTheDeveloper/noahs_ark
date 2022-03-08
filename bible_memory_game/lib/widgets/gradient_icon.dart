import 'package:bible_memory_game/utils/themes.dart';
import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  final Widget child;

  RadiantGradientMask(this.child);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          MainTheme.mainButtonGradient.createShader(bounds),
      child: child,
    );
  }
}
