import '../utils/enums.dart';

class BibleVerse {
  final String? chapter;
  final String? verse;
  final String? book;
  final String? text;
  final TestamentMode? testamentMode;

  BibleVerse({
    this.book,
    this.chapter,
    this.verse,
    this.text,
    this.testamentMode,
  });
}
