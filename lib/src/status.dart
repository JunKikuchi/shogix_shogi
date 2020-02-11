import 'color.dart';

abstract class Status {
  Status();
}

class Playing extends Status {
  final Color turn;

  Playing(this.turn);
}

class GameOver extends Status {
  final Color winner;
  final GameOverType gameOverType;

  GameOver(this.winner, this.gameOverType);
}

enum GameOverType { Mate, Resign, Timeout, Illegal }
