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
    return Shogi(
        moves().contains(move) ? position.move(move) : position.illegal(),
        pastPositions.add(position));
  }

  Shogi drop(Drop drop) {
    if (status() is GameOver) {
      return null;
    }
    return Shogi(
        drops().contains(drop) ? position.drop(drop) : position.illegal(),
        pastPositions.add(position));
  }

  Shogi resign() {
    if (status() is GameOver) {
      return null;
    }
    return Shogi(position.resign(), pastPositions.add(position));
  }

  Shogi timeout() {
    if (status() is GameOver) {
      return null;
    }
    return Shogi(position.timeout(), pastPositions.add(position));
  }

  Status status() {
    return position.status();
  }
}
