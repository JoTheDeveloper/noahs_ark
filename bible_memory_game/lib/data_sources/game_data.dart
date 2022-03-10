import 'package:bible_memory_game/models/bible_character_model.dart';
import '../models/bible_verse_model.dart';
import '../utils/enums.dart';

class GameDataStore {
  List<String> getShuffledImages() {
    symbolImagesList.shuffle();
    return symbolImagesList;
  }

  List<String> symbolImagesList = [
    "assets/memory_game/bible.png",
    "assets/memory_game/bible.png",
    "assets/memory_game/dove.png",
    "assets/memory_game/dove.png",
    "assets/memory_game/lamb.png",
    "assets/memory_game/lamb.png",
    "assets/memory_game/rainbow.png",
    "assets/memory_game/rainbow.png",
    "assets/memory_game/seedling.png",
    "assets/memory_game/seedling.png",
    "assets/memory_game/vine.png",
    "assets/memory_game/vine.png",
    "assets/memory_game/snake.png",
    "assets/memory_game/snake.png",
    "assets/memory_game/wine.png",
    "assets/memory_game/wine.png",
    "assets/memory_game/love.png",
    "assets/memory_game/love.png",
    "assets/memory_game/ark.png",
    "assets/memory_game/ark.png",
    "assets/memory_game/bread.png",
    "assets/memory_game/bread.png",
    "assets/memory_game/jesus_cross.png",
    "assets/memory_game/jesus_cross.png",
  ];

  List<BibleCharacter> bibleCharacters = [
    BibleCharacter(
      testamentMode: TestamentMode.OldTestament,
      description:
          'This prophet spent some years of his life running from King Ahab and his wife.',
      name: "Elijah",
    ),
    BibleCharacter(
      testamentMode: TestamentMode.NewTestament,
      description:
          'This apostle was blinded after seeing Jesus appear to him on the Damascus road.',
      name: "Paul",
    ),
  ];

  List<BibleVerse> bibleVerses = [
    BibleVerse(
      book: 'John',
      chapter: '3',
      verse: '16',
      text: "For God so loved the world that He gave his one and only son.",
      testamentMode: TestamentMode.NewTestament,
    ),
    BibleVerse(
      book: 'Genesis',
      chapter: '1',
      verse: '1',
      text: "In the beginning, God created the heavens and the earth",
      testamentMode: TestamentMode.OldTestament,
    ),
    BibleVerse(
      book: '1 John',
      chapter: '3',
      verse: '18',
      text: "Little children, let's not love with words or "
          "speech but with action and truth",
      testamentMode: TestamentMode.NewTestament,
    ),
    BibleVerse(
      book: 'John',
      chapter: '3',
      verse: '16',
      text: "For God so loved the world that He gave his one and only son.",
      testamentMode: TestamentMode.NewTestament,
    ),
  ];
}
