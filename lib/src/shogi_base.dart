import 'package:built_collection/built_collection.dart';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

class Shogi {
  final Position position;
  final BuiltList<Position> pastPositions;

  const Shogi(this.position, this.pastPositions);

  BuiltMap<Square, BuiltMap<Square, Promotion>> moves() {
    throw UnimplementedError();
  }

  BuiltMap<BuiltSet<PieceType>, BuiltSet<Square>> drops() {
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

enum Promotion {
  No,
  Option,
  Yes,
}

class Move {
  final Square dest;
  final Square src;
  final bool promotion;

  Move(this.dest, this.src, this.promotion);
}

class Drop {
  final Square dest;
  final PieceType piece;

  Drop(this.dest, this.piece);
}

abstract class Status {
  const Status();
}

class Playing extends Status {
  final Color turn;

  const Playing(this.turn);
}

class GameOver extends Status {
  final Color winner;
  final GameOverType gameOverType;

  const GameOver(this.winner, this.gameOverType);
}

enum GameOverType { Mate, Resign, Timeout, Illegal }

class Position {
  final Color turn;
  final BuiltMap<Square, Piece> board;
  final BuiltMap<PieceType, int> blackStand;
  final BuiltMap<PieceType, int> whiteStand;

  const Position(this.turn, this.board, this.blackStand, this.whiteStand);

  Position.hirate()
      : turn = Color.Black,
        board = BuiltMap<Square, Piece>({
          F9R1: Piece.lance(Color.White),
          F8R1: Piece.knight(Color.White),
          F7R1: Piece.silver(Color.White),
          F6R1: Piece.gold(Color.White),
          F5R1: Piece.king(Color.White),
          F4R1: Piece.gold(Color.White),
          F3R1: Piece.silver(Color.White),
          F2R1: Piece.knight(Color.White),
          F1R1: Piece.lance(Color.White),
          F8R2: Piece.rook(Color.White),
          F2R2: Piece.bishop(Color.White),
          F9R3: Piece.pawn(Color.White),
          F8R3: Piece.pawn(Color.White),
          F7R3: Piece.pawn(Color.White),
          F6R3: Piece.pawn(Color.White),
          F5R3: Piece.pawn(Color.White),
          F4R3: Piece.pawn(Color.White),
          F3R3: Piece.pawn(Color.White),
          F2R3: Piece.pawn(Color.White),
          F1R3: Piece.pawn(Color.White),
          F9R7: Piece.pawn(Color.Black),
          F8R7: Piece.pawn(Color.Black),
          F7R7: Piece.pawn(Color.Black),
          F6R7: Piece.pawn(Color.Black),
          F5R7: Piece.pawn(Color.Black),
          F4R7: Piece.pawn(Color.Black),
          F3R7: Piece.pawn(Color.Black),
          F2R7: Piece.pawn(Color.Black),
          F1R7: Piece.pawn(Color.Black),
          F8R8: Piece.bishop(Color.Black),
          F2R8: Piece.rook(Color.Black),
          F9R9: Piece.lance(Color.Black),
          F8R9: Piece.knight(Color.Black),
          F7R9: Piece.silver(Color.Black),
          F6R9: Piece.gold(Color.Black),
          F5R9: Piece.king(Color.Black),
          F4R9: Piece.gold(Color.Black),
          F3R9: Piece.silver(Color.Black),
          F2R9: Piece.knight(Color.Black),
          F1R9: Piece.lance(Color.Black)
        }),
        blackStand = BuiltMap<PieceType, int>(),
        whiteStand = BuiltMap<PieceType, int>();
}

const Square F9R1 = Square(File.F9, Rank.R1);
const Square F8R1 = Square(File.F8, Rank.R1);
const Square F7R1 = Square(File.F7, Rank.R1);
const Square F6R1 = Square(File.F6, Rank.R1);
const Square F5R1 = Square(File.F5, Rank.R1);
const Square F4R1 = Square(File.F4, Rank.R1);
const Square F3R1 = Square(File.F3, Rank.R1);
const Square F2R1 = Square(File.F2, Rank.R1);
const Square F1R1 = Square(File.F1, Rank.R1);

const Square F9R2 = Square(File.F9, Rank.R2);
const Square F8R2 = Square(File.F8, Rank.R2);
const Square F7R2 = Square(File.F7, Rank.R2);
const Square F6R2 = Square(File.F6, Rank.R2);
const Square F5R2 = Square(File.F5, Rank.R2);
const Square F4R2 = Square(File.F4, Rank.R2);
const Square F3R2 = Square(File.F3, Rank.R2);
const Square F2R2 = Square(File.F2, Rank.R2);
const Square F1R2 = Square(File.F1, Rank.R2);

const Square F9R3 = Square(File.F9, Rank.R3);
const Square F8R3 = Square(File.F8, Rank.R3);
const Square F7R3 = Square(File.F7, Rank.R3);
const Square F6R3 = Square(File.F6, Rank.R3);
const Square F5R3 = Square(File.F5, Rank.R3);
const Square F4R3 = Square(File.F4, Rank.R3);
const Square F3R3 = Square(File.F3, Rank.R3);
const Square F2R3 = Square(File.F2, Rank.R3);
const Square F1R3 = Square(File.F1, Rank.R3);

const Square F9R4 = Square(File.F9, Rank.R4);
const Square F8R4 = Square(File.F8, Rank.R4);
const Square F7R4 = Square(File.F7, Rank.R4);
const Square F6R4 = Square(File.F6, Rank.R4);
const Square F5R4 = Square(File.F5, Rank.R4);
const Square F4R4 = Square(File.F4, Rank.R4);
const Square F3R4 = Square(File.F3, Rank.R4);
const Square F2R4 = Square(File.F2, Rank.R4);
const Square F1R4 = Square(File.F1, Rank.R4);

const Square F9R5 = Square(File.F9, Rank.R5);
const Square F8R5 = Square(File.F8, Rank.R5);
const Square F7R5 = Square(File.F7, Rank.R5);
const Square F6R5 = Square(File.F6, Rank.R5);
const Square F5R5 = Square(File.F5, Rank.R5);
const Square F4R5 = Square(File.F4, Rank.R5);
const Square F3R5 = Square(File.F3, Rank.R5);
const Square F2R5 = Square(File.F2, Rank.R5);
const Square F1R5 = Square(File.F1, Rank.R5);

const Square F9R6 = Square(File.F9, Rank.R6);
const Square F8R6 = Square(File.F8, Rank.R6);
const Square F7R6 = Square(File.F7, Rank.R6);
const Square F6R6 = Square(File.F6, Rank.R6);
const Square F5R6 = Square(File.F5, Rank.R6);
const Square F4R6 = Square(File.F4, Rank.R6);
const Square F3R6 = Square(File.F3, Rank.R6);
const Square F2R6 = Square(File.F2, Rank.R6);
const Square F1R6 = Square(File.F1, Rank.R6);

const Square F9R7 = Square(File.F9, Rank.R7);
const Square F8R7 = Square(File.F8, Rank.R7);
const Square F7R7 = Square(File.F7, Rank.R7);
const Square F6R7 = Square(File.F6, Rank.R7);
const Square F5R7 = Square(File.F5, Rank.R7);
const Square F4R7 = Square(File.F4, Rank.R7);
const Square F3R7 = Square(File.F3, Rank.R7);
const Square F2R7 = Square(File.F2, Rank.R7);
const Square F1R7 = Square(File.F1, Rank.R7);

const Square F9R8 = Square(File.F9, Rank.R8);
const Square F8R8 = Square(File.F8, Rank.R8);
const Square F7R8 = Square(File.F7, Rank.R8);
const Square F6R8 = Square(File.F6, Rank.R8);
const Square F5R8 = Square(File.F5, Rank.R8);
const Square F4R8 = Square(File.F4, Rank.R8);
const Square F3R8 = Square(File.F3, Rank.R8);
const Square F2R8 = Square(File.F2, Rank.R8);
const Square F1R8 = Square(File.F1, Rank.R8);

const Square F9R9 = Square(File.F9, Rank.R9);
const Square F8R9 = Square(File.F8, Rank.R9);
const Square F7R9 = Square(File.F7, Rank.R9);
const Square F6R9 = Square(File.F6, Rank.R9);
const Square F5R9 = Square(File.F5, Rank.R9);
const Square F4R9 = Square(File.F4, Rank.R9);
const Square F3R9 = Square(File.F3, Rank.R9);
const Square F2R9 = Square(File.F2, Rank.R9);
const Square F1R9 = Square(File.F1, Rank.R9);

class Square {
  final File file;
  final Rank rank;

  const Square(this.file, this.rank);

  @override
  int get hashCode {
    return ((file.index + 1) * 10) + (rank.index + 1);
  }

  @override
  bool operator ==(a) {
    return hashCode == a.hashCode;
  }
}

abstract class Piece {
  final PieceType pieceType;
  final Color color;
  final BuiltList<Movement> movements;

  const Piece(this.pieceType, this.color, this.movements);

  factory Piece.pawn(color) {
    return NormalPiece(
        PieceType.Pawn, color, BuiltList<Movement>(), BuiltList<Movement>());
  }

  factory Piece.lance(color) {
    return NormalPiece(
        PieceType.Lance, color, BuiltList<Movement>(), BuiltList<Movement>());
  }

  factory Piece.knight(color) {
    return NormalPiece(
        PieceType.Knight, color, BuiltList<Movement>(), BuiltList<Movement>());
  }

  factory Piece.silver(color) {
    return NormalPiece(
        PieceType.Silver, color, BuiltList<Movement>(), BuiltList<Movement>());
  }

  factory Piece.gold(color) {
    return PromotedPiece(PieceType.Gold, color, BuiltList<Movement>());
  }

  factory Piece.bishop(color) {
    return NormalPiece(
        PieceType.Bishop, color, BuiltList<Movement>(), BuiltList<Movement>());
  }

  factory Piece.rook(color) {
    return NormalPiece(
        PieceType.Rook, color, BuiltList<Movement>(), BuiltList<Movement>());
  }

  factory Piece.king(color) {
    return PromotedPiece(PieceType.King, color, BuiltList<Movement>());
  }
}

class NormalPiece extends Piece {
  final BuiltList<Movement> promotedMovements;

  const NormalPiece(PieceType pieceType, Color color,
      BuiltList<Movement> movements, this.promotedMovements)
      : super(pieceType, color, movements);

  PromotedPiece promote() {
    return PromotedPiece(pieceType, color, movements);
  }
}

class PromotedPiece extends Piece {
  const PromotedPiece(
      PieceType pieceType, Color color, BuiltList<Movement> movements)
      : super(pieceType, color, movements);
}

enum Color { Black, White }

enum File { F1, F2, F3, F4, F5, F6, F7, F8, F9 }

enum Rank { R9, R8, R7, R6, R5, R4, R3, R2, R1 }

enum PieceType { Pawn, Lance, Knight, Silver, Gold, Bishop, Rook, King }

class Movement {
  final Direction direction;
  final MoveNumber moveNumber;

  Movement(this.direction, this.moveNumber);
}

enum Direction { UpLeft, Up, UpRight, Right, DownRight, Down, DownLeft, Left }

enum MoveNumber { One, Any }
