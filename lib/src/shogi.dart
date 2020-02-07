import 'position.dart';

class Shogi {
  final Position position;
  final Positions pastPositions;

  Shogi(this.position, List<Position> pastPositions)
      : pastPositions = Positions(pastPositions);

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
    throw UnimplementedError();
  }

  Shogi drop(Drop drop) {
    throw UnimplementedError();
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
