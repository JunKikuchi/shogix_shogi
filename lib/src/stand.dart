import 'package:built_collection/built_collection.dart';
import 'piece.dart';

class Stand {
  final BuiltMap<PieceType, int> stand;

  Stand(Map<PieceType, int> stand) : stand = BuiltMap<PieceType, int>(stand);
}
