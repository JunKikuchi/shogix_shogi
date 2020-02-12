import 'package:built_collection/built_collection.dart';
import 'square.dart';
import 'piece.dart';
import 'position.dart';
import 'color.dart';
import 'stand.dart';

class Board {
  final BuiltMap<Square, Piece> board;

  Board(Map<Square, Piece> board) : board = BuiltMap<Square, Piece>(board);

  Movables movables(Color color) {
    throw UnimplementedError();
  }

  Droppables droppables(Color color, Stand stand) {
    throw UnimplementedError();
  }
}
