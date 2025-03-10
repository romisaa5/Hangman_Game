import 'dart:math';

class Hangman {
  final List<String> words = [
    "flutter",
    "dart",
    "programming",
    "hangman",
    "developer"
  ];
  late String targetWord;
  late List<String> hiddenWord;
  int attempts = 6;
  List<String> guessedLetters = [];
    Hangman() {
    targetWord = words[Random().nextInt(words.length)];
    hiddenWord = List.filled(targetWord.length, "_");
  }
}
