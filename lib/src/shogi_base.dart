import 'package:built_collection/built_collection.dart';

class Shogi {
  final Position position;
  final Positions pastPositions;

  Shogi(this.position, List<Position> pastPositions)
      : pastPositions = Positions(pastPositions);

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

class Positions {
  final BuiltList<Position> positions;

  Positions(List<Position> positions)
      : positions = BuiltList<Position>(positions);
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

class Position {
  final Color turn;
  final Board board;
  final Stand blackStand;
  final Stand whiteStand;

  Position(this.turn, board, blackStand, whiteStand)
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
}

class Board {
  final BuiltMap<Square, Piece> board;

  Board(Map<Square, Piece> board) : board = BuiltMap<Square, Piece>(board);
}

class Stand {
  final BuiltMap<PieceType, int> stand;

  Stand(Map<PieceType, int> stand) : stand = BuiltMap<PieceType, int>(stand);
}

class Square {
  final File file;
  final Rank rank;

  const Square(this.file, this.rank);

  static const F9R1 = Square(File.F9, Rank.R1);
  static const F8R1 = Square(File.F8, Rank.R1);
  static const F7R1 = Square(File.F7, Rank.R1);
  static const F6R1 = Square(File.F6, Rank.R1);
  static const F5R1 = Square(File.F5, Rank.R1);
  static const F4R1 = Square(File.F4, Rank.R1);
  static const F3R1 = Square(File.F3, Rank.R1);
  static const F2R1 = Square(File.F2, Rank.R1);
  static const F1R1 = Square(File.F1, Rank.R1);

  static const F9R2 = Square(File.F9, Rank.R2);
  static const F8R2 = Square(File.F8, Rank.R2);
  static const F7R2 = Square(File.F7, Rank.R2);
  static const F6R2 = Square(File.F6, Rank.R2);
  static const F5R2 = Square(File.F5, Rank.R2);
  static const F4R2 = Square(File.F4, Rank.R2);
  static const F3R2 = Square(File.F3, Rank.R2);
  static const F2R2 = Square(File.F2, Rank.R2);
  static const F1R2 = Square(File.F1, Rank.R2);

  static const F9R3 = Square(File.F9, Rank.R3);
  static const F8R3 = Square(File.F8, Rank.R3);
  static const F7R3 = Square(File.F7, Rank.R3);
  static const F6R3 = Square(File.F6, Rank.R3);
  static const F5R3 = Square(File.F5, Rank.R3);
  static const F4R3 = Square(File.F4, Rank.R3);
  static const F3R3 = Square(File.F3, Rank.R3);
  static const F2R3 = Square(File.F2, Rank.R3);
  static const F1R3 = Square(File.F1, Rank.R3);

  static const F9R4 = Square(File.F9, Rank.R4);
  static const F8R4 = Square(File.F8, Rank.R4);
  static const F7R4 = Square(File.F7, Rank.R4);
  static const F6R4 = Square(File.F6, Rank.R4);
  static const F5R4 = Square(File.F5, Rank.R4);
  static const F4R4 = Square(File.F4, Rank.R4);
  static const F3R4 = Square(File.F3, Rank.R4);
  static const F2R4 = Square(File.F2, Rank.R4);
  static const F1R4 = Square(File.F1, Rank.R4);

  static const F9R5 = Square(File.F9, Rank.R5);
  static const F8R5 = Square(File.F8, Rank.R5);
  static const F7R5 = Square(File.F7, Rank.R5);
  static const F6R5 = Square(File.F6, Rank.R5);
  static const F5R5 = Square(File.F5, Rank.R5);
  static const F4R5 = Square(File.F4, Rank.R5);
  static const F3R5 = Square(File.F3, Rank.R5);
  static const F2R5 = Square(File.F2, Rank.R5);
  static const F1R5 = Square(File.F1, Rank.R5);

  static const F9R6 = Square(File.F9, Rank.R6);
  static const F8R6 = Square(File.F8, Rank.R6);
  static const F7R6 = Square(File.F7, Rank.R6);
  static const F6R6 = Square(File.F6, Rank.R6);
  static const F5R6 = Square(File.F5, Rank.R6);
  static const F4R6 = Square(File.F4, Rank.R6);
  static const F3R6 = Square(File.F3, Rank.R6);
  static const F2R6 = Square(File.F2, Rank.R6);
  static const F1R6 = Square(File.F1, Rank.R6);

  static const F9R7 = Square(File.F9, Rank.R7);
  static const F8R7 = Square(File.F8, Rank.R7);
  static const F7R7 = Square(File.F7, Rank.R7);
  static const F6R7 = Square(File.F6, Rank.R7);
  static const F5R7 = Square(File.F5, Rank.R7);
  static const F4R7 = Square(File.F4, Rank.R7);
  static const F3R7 = Square(File.F3, Rank.R7);
  static const F2R7 = Square(File.F2, Rank.R7);
  static const F1R7 = Square(File.F1, Rank.R7);

  static const F9R8 = Square(File.F9, Rank.R8);
  static const F8R8 = Square(File.F8, Rank.R8);
  static const F7R8 = Square(File.F7, Rank.R8);
  static const F6R8 = Square(File.F6, Rank.R8);
  static const F5R8 = Square(File.F5, Rank.R8);
  static const F4R8 = Square(File.F4, Rank.R8);
  static const F3R8 = Square(File.F3, Rank.R8);
  static const F2R8 = Square(File.F2, Rank.R8);
  static const F1R8 = Square(File.F1, Rank.R8);

  static const F9R9 = Square(File.F9, Rank.R9);
  static const F8R9 = Square(File.F8, Rank.R9);
  static const F7R9 = Square(File.F7, Rank.R9);
  static const F6R9 = Square(File.F6, Rank.R9);
  static const F5R9 = Square(File.F5, Rank.R9);
  static const F4R9 = Square(File.F4, Rank.R9);
  static const F3R9 = Square(File.F3, Rank.R9);
  static const F2R9 = Square(File.F2, Rank.R9);
  static const F1R9 = Square(File.F1, Rank.R9);

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
  final PieceMovements movements;

  Piece(this.pieceType, this.color, List<PieceMovement> movements)
      : movements = PieceMovements(movements);

  factory Piece.pawn(color) {
    return NormalPiece(PieceType.Pawn, color, [], []);
  }

  factory Piece.lance(color) {
    return NormalPiece(PieceType.Lance, color, [], []);
  }

  factory Piece.knight(color) {
    return NormalPiece(PieceType.Knight, color, [], []);
  }

  factory Piece.silver(color) {
    return NormalPiece(PieceType.Silver, color, [], []);
  }

  factory Piece.gold(color) {
    return PromotedPiece(PieceType.Gold, color, []);
  }

  factory Piece.bishop(color) {
    return NormalPiece(PieceType.Bishop, color, [], []);
  }

  factory Piece.rook(color) {
    return NormalPiece(PieceType.Rook, color, [], []);
  }

  factory Piece.king(color) {
    return PromotedPiece(PieceType.King, color, []);
  }
}

class NormalPiece extends Piece {
  final List<PieceMovement> _promotedMovements;

  NormalPiece(PieceType pieceType, Color color, List<PieceMovement> movements,
      this._promotedMovements)
      : super(pieceType, color, movements);

  PromotedPiece promote() {
    return PromotedPiece(pieceType, color, _promotedMovements);
  }
}

class PromotedPiece extends Piece {
  PromotedPiece(PieceType pieceType, Color color, List<PieceMovement> movements)
      : super(pieceType, color, movements);
}

enum Color { Black, White }

enum File { F1, F2, F3, F4, F5, F6, F7, F8, F9 }

enum Rank { R9, R8, R7, R6, R5, R4, R3, R2, R1 }

enum PieceType { Pawn, Lance, Knight, Silver, Gold, Bishop, Rook, King }

class PieceMovement {
  final Direction direction;
  final MoveNumber moveNumber;

  PieceMovement(this.direction, this.moveNumber);
}

class PieceMovements {
  final BuiltList<PieceMovement> movements;

  PieceMovements(List<PieceMovement> movements)
      : movements = BuiltList(movements);
}

enum Direction { UpLeft, Up, UpRight, Right, DownRight, Down, DownLeft, Left }

enum MoveNumber { One, Any }
