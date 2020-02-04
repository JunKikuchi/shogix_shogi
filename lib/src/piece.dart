import 'package:built_collection/built_collection.dart';
import 'color.dart';

abstract class Piece {
  final PieceType pieceType;
  final Color color;
  final Movements movements;

  Piece(this.pieceType, this.color, List<_Movement> movements)
      : movements = Movements(movements);

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
  final List<_Movement> _promotedMovements;

  NormalPiece(PieceType pieceType, Color color, List<_Movement> movements,
      this._promotedMovements)
      : super(pieceType, color, movements);

  PromotedPiece promote() {
    return PromotedPiece(pieceType, color, _promotedMovements);
  }
}

class PromotedPiece extends Piece {
  PromotedPiece(PieceType pieceType, Color color, List<_Movement> movements)
      : super(pieceType, color, movements);
}

enum PieceType { Pawn, Lance, Knight, Silver, Gold, Bishop, Rook, King }

class _Movement {
  final Direction direction;
  final MoveNumber moveNumber;

  _Movement(this.direction, this.moveNumber);
}

class Movements {
  final BuiltList<_Movement> movements;

  Movements(List<_Movement> movements) : movements = BuiltList(movements);
}

enum Direction { UpLeft, Up, UpRight, Right, DownRight, Down, DownLeft, Left }

enum MoveNumber { One, Any }
