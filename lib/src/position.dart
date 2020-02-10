import 'package:built_collection/built_collection.dart';
import 'color.dart';
import 'square.dart';
import 'piece.dart';

class Position {
  final Color turn;
  final Board board;
  final Stand blackStand;
  final Stand whiteStand;

  Position(this.turn, Map<Square, Piece> board, Map<PieceType, int> blackStand,
      Map<PieceType, int> whiteStand)
      : board = Board(board),
        blackStand = Stand(blackStand),
        whiteStand = Stand(whiteStand);

  Position.hirate()
      : turn = Color.Black,
        board = Board({
          Square.F9R1: Piece.lance(Color.White),
          Square.F8R1: Piece.knight(Color.White),
          Square.F7R1: Piece.silver(Color.White),
          Square.F6R1: Piece.gold(Color.White),
          Square.F5R1: Piece.king(Color.White),
          Square.F4R1: Piece.gold(Color.White),
          Square.F3R1: Piece.silver(Color.White),
          Square.F2R1: Piece.knight(Color.White),
          Square.F1R1: Piece.lance(Color.White),
          Square.F8R2: Piece.rook(Color.White),
          Square.F2R2: Piece.bishop(Color.White),
          Square.F9R3: Piece.pawn(Color.White),
          Square.F8R3: Piece.pawn(Color.White),
          Square.F7R3: Piece.pawn(Color.White),
          Square.F6R3: Piece.pawn(Color.White),
          Square.F5R3: Piece.pawn(Color.White),
          Square.F4R3: Piece.pawn(Color.White),
          Square.F3R3: Piece.pawn(Color.White),
          Square.F2R3: Piece.pawn(Color.White),
          Square.F1R3: Piece.pawn(Color.White),
          Square.F9R7: Piece.pawn(Color.Black),
          Square.F8R7: Piece.pawn(Color.Black),
          Square.F7R7: Piece.pawn(Color.Black),
          Square.F6R7: Piece.pawn(Color.Black),
          Square.F5R7: Piece.pawn(Color.Black),
          Square.F4R7: Piece.pawn(Color.Black),
          Square.F3R7: Piece.pawn(Color.Black),
          Square.F2R7: Piece.pawn(Color.Black),
          Square.F1R7: Piece.pawn(Color.Black),
          Square.F8R8: Piece.bishop(Color.Black),
          Square.F2R8: Piece.rook(Color.Black),
          Square.F9R9: Piece.lance(Color.Black),
          Square.F8R9: Piece.knight(Color.Black),
          Square.F7R9: Piece.silver(Color.Black),
          Square.F6R9: Piece.gold(Color.Black),
          Square.F5R9: Piece.king(Color.Black),
          Square.F4R9: Piece.gold(Color.Black),
          Square.F3R9: Piece.silver(Color.Black),
          Square.F2R9: Piece.knight(Color.Black),
          Square.F1R9: Piece.lance(Color.Black)
        }),
        blackStand = Stand({}),
        whiteStand = Stand({});

  Moves moves() {
    throw UnimplementedError();
  }

  Drops drops() {
    throw UnimplementedError();
  }

  Position move(Move move) {
    throw UnimplementedError();
  }

  Position drop(Drop drop) {
    throw UnimplementedError();
  }

  Position illegal() {
    throw UnimplementedError();
  }

  Position resign() {
    throw UnimplementedError();
  }

  Position timeout() {
    throw UnimplementedError();
  }

  Status status() {
    throw UnimplementedError();
  }
}

class Board {
  final BuiltMap<Square, Piece> board;

  Board(Map<Square, Piece> board) : board = BuiltMap<Square, Piece>(board);
}

class Stand {
  final BuiltMap<PieceType, int> stand;

  Stand(Map<PieceType, int> stand) : stand = BuiltMap<PieceType, int>(stand);
}

class Positions {
  final List<Position> positions;

  const Positions([this.positions = const []]);

  Positions add(Position position) {
    var newPositions = List.from(positions);
    newPositions.add(position);
    return Positions(newPositions);
  }
}

class Moves {
  final BuiltMap<Square, BuiltMap<Square, Promotion>> moves;

  Moves([Map<Square, Map<Square, Promotion>> moves = const {}])
      : moves = BuiltMap<Square, BuiltMap<Square, Promotion>>(
            moves.map((k, v) => MapEntry(k, BuiltMap<Square, Promotion>(v))));

  Moves removeRepetition(Positions positions) {
    throw UnimplementedError();
  }

  bool contains(Move move) {
    throw UnimplementedError();
  }
}

class Drops {
  final BuiltMap<BuiltSet<PieceType>, BuiltSet<Square>> drops;

  Drops([Map<Set<PieceType>, Set<Square>> drops = const {}])
      : drops = BuiltMap<BuiltSet<PieceType>, BuiltSet<Square>>(drops.map(
            (k, v) => MapEntry(BuiltSet<PieceType>(k), BuiltSet<Square>(v))));

  Drops removeRepetition(Positions positions) {
    throw UnimplementedError();
  }

  bool contains(Drop drop) {
    throw UnimplementedError();
  }
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
