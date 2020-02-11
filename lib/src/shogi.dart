import 'position.dart';
import 'status.dart';

class Shogi {
  final Position position;
  final Positions pastPositions;

  Shogi(this.position, [this.pastPositions = const Positions()]);

  Movables movables() {
    return _guard(
        position.movables().removeRepetition(pastPositions), Movables());
  }

  Droppables droppables() {
    return _guard(
        position.droppables().removeRepetition(pastPositions), Droppables());
  }

  Shogi move(Move move) {
    return _nextShogi(
        movables().contains(move) ? position.move(move) : position.illegal());
  }

  Shogi drop(Drop drop) {
    return _nextShogi(
        droppables().contains(drop) ? position.drop(drop) : position.illegal());
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
