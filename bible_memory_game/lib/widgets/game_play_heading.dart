import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/themes.dart';

class GamePlayHeading extends StatelessWidget {
  final String? title;
  final String? subTitle;

  GamePlayHeading({
    Key? key,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title ?? 'Page title',
            style: GoogleFonts.cinzel(
              textStyle: TextStyle(
                color: MainTheme.lightTextColor,
                fontSize: 30,
              ),
            ),
          ),
          Text(
            subTitle ?? 'Page subtitle',
            style: GoogleFonts.cinzel(
              textStyle: TextStyle(
                color: MainTheme.lightTextColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
