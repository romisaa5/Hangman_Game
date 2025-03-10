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

  void endGame() {
      if (!hiddenWord.contains("_")) {
      print("Congratulations! You guessed the word: $targetWord");
    } else {
      print("Game Over! The correct word was: $targetWord");
    }
  }
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

  void displayGameState() {
    print("Word: ${hiddenWord.join(" ")}");
    print("Attempts left: $attempts");
    print("Guessed letters: ${guessedLetters.join(", ")}");
  }
  void checkGuess(String guess) {
        guessedLetters.add(guess);
    if (targetWord.contains(guess)) {
      for (int i = 0; i < targetWord.length; i++) {
        if (targetWord[i] == guess) {
          hiddenWord[i] = guess;
        }
      }
    } else {
      attempts--;
      print("Wrong guess! You lost one attempt.");
    }
  }
}
void main() {
  Hangman game = Hangman();
  game.startGame();
}
