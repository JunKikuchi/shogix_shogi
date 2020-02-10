import 'position.dart';

class Shogi {
  final Position position;
  final Positions pastPositions;

  Shogi(this.position, [this.pastPositions = const Positions()]);

  Moves moves() {
    if (status() is GameOver) {
      return Moves();
    }
    return position.moves().removeRepetition(pastPositions);
  }

  Drops drops() {
    if (status() is GameOver) {
      return Drops();
    }
    return position.drops().removeRepetition(pastPositions);
  }

  Shogi move(Move move) {
    if (status() is GameOver) {
      return null;
    }
    return Shogi(position.move(move), pastPositions.add(position));
  }

  Shogi drop(Drop drop) {
    if (status() is GameOver) {
      return null;
    }
    return Shogi(position.drop(drop), pastPositions.add(position));
  }

  Shogi resign() {
    throw UnimplementedError();
  }

  Shogi timeout() {
    throw UnimplementedError();
  }

  Status status() {
    return position.status();
  }
}
