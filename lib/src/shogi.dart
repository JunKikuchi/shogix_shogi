import 'position.dart';

class Shogi {
  final Position position;
  final Positions pastPositions;

  Shogi(this.position, [this.pastPositions = const Positions()]);

  Moves moves() {
    return _guard(position.moves().removeRepetition(pastPositions), Moves());
  }

  Drops drops() {
    return _guard(position.drops().removeRepetition(pastPositions), Drops());
  }

  Shogi move(Move move) {
    return _nextShogi(
        moves().contains(move) ? position.move(move) : position.illegal());
  }

  Shogi drop(Drop drop) {
    return _nextShogi(
        drops().contains(drop) ? position.drop(drop) : position.illegal());
  }

  Shogi resign() {
    return _nextShogi(position.resign());
  }

  Shogi timeout() {
    return _nextShogi(position.timeout());
  }

  Status status() {
    return position.status();
  }

  dynamic _guard(next, [gameover]) {
    if (status() is GameOver) {
      return gameover;
    }
    return next;
  }

  Shogi _nextShogi(Position newPosition) {
    return _guard(Shogi(newPosition, pastPositions.add(position)));
  }
}
