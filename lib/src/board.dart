import 'package:built_collection/built_collection.dart';
import 'square.dart';
import 'piece.dart';

class Board {
  final BuiltMap<Square, Piece> board;

  Board(Map<Square, Piece> board) : board = BuiltMap<Square, Piece>(board);
}
