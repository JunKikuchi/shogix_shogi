import 'package:built_collection/built_collection.dart';
import 'position.dart';
import 'square.dart';
import 'piece.dart';
import 'color.dart';

class Shogi {
  final Position position;
  final Positions pastPositions;

  Shogi(this.position, List<Position> pastPositions)
      : pastPositions = Positions(pastPositions);

  Moves moves() {
    throw UnimplementedError();
  }

  Drops drops() {
    throw UnimplementedError();
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
    throw UnimplementedError();
  }
}

class Moves {
  final BuiltMap<Square, BuiltMap<Square, Promotion>> moves;

  Moves(Map<Square, Map<Square, Promotion>> moves)
      : moves = BuiltMap<Square, BuiltMap<Square, Promotion>>(moves);
}

class Drops {
  final BuiltMap<BuiltSet<PieceType>, BuiltSet<Square>> drops;

  Drops(Map<Set<PieceType>, Set<Square>> drops)
      : drops = BuiltMap<BuiltSet<PieceType>, BuiltSet<Square>>(drops);
}

enum Promotion {
  No,
  Option,
  Yes,
}

abstract class Movement {
  final Square dest;

  Movement(this.dest);
}

class Move extends Movement {
  final Square src;
  final bool promotion;

  Move(dest, this.src, this.promotion) : super(dest);
}

class Drop extends Movement {
  final PieceType piece;

  Drop(dest, this.piece) : super(dest);
}

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
