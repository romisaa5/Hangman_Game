import 'dart:io';
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

  void startGame() {
    print('Welcome To Hangman Game !');
    print('Try to guess the Word ');
    while (attempts > 0 && hiddenWord.contains('_')) {
      displayGameState();
      String guess = getUserInput();
      checkGuess(guess);
    }
    endGame();
  }

  void endGame() {}
  String getUserInput() {
    stdout.write("Enter a letter: ");
    String? input = stdin.readLineSync() ?? 'a'.toLowerCase();
    if (input.isEmpty ||
        input == null ||
        input.length > 1 ||
        guessedLetters.contains(input)) {
      print("Invalid input. Please enter a single new letter.");
      return getUserInput();
    }
    return input;
  }

  void displayGameState() {}
  void checkGuess(String guess) {}
}
