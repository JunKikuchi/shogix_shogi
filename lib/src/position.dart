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
  final BuiltList<Position> positions;

  Positions(List<Position> positions)
      : positions = BuiltList<Position>(positions);
}
