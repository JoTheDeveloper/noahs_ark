import 'package:bible_memory_game/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransparentButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;

  const TransparentButton({Key? key, @required this.text, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text ?? '' .toUpperCase(),
            style: GoogleFonts.bebasNeue(
              textStyle: TextStyle(
                color: MainTheme.darkTextColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          border: Border.all(
            color: MainTheme.darkTextColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
