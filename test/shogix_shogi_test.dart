import 'package:shogix_shogi/shogi.dart';
import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';

void main() {
  group('Shogi', () {
    Position position;
    Shogi shogi;

    setUp(() {
      position = Position(
          Color.Black,
          BuiltMap({F5R5: Piece.pawn(Color.Black)}),
          BuiltMap<PieceType, int>({PieceType.Pawn: 1}),
          BuiltMap<PieceType, int>());

      shogi = Shogi(position, BuiltList<Position>([]));
    });

    test('moves', () {
      var moves = BuiltMap<Square, BuiltMap<Square, Promotion>>({
        F5R5: BuiltMap<Square, Promotion>({F5R4: Promotion.No})
      });

      expect(shogi.moves(), moves);
    });

    test('drops', () {
      var squares = <Square>{};
      for (var file in File.values) {
        if (file == File.F5) {
          continue;
        }
        for (var rank in Rank.values) {
          squares.add(Square(file, rank));
        }
      }

      var drops = BuiltMap<BuiltSet<PieceType>, BuiltSet<Square>>({
        BuiltSet<PieceType>({PieceType.Pawn}): BuiltSet<Square>(squares)
      });

      expect(shogi.drops(), drops);
    });

    test('move', () {
      var newPosition = Position(
          Color.White,
          BuiltMap({F5R4: Piece.pawn(Color.Black)}),
          BuiltMap<PieceType, int>({PieceType.Pawn: 1}),
          BuiltMap<PieceType, int>());

      var newShogi = Shogi(newPosition, BuiltList<Position>([]));

      expect(shogi.move(F5R4, F5R5, false), newShogi);
    });

    test('drop', () {
      var newPosition = Position(
          Color.White,
          BuiltMap(
              {F5R5: Piece.pawn(Color.Black), F4R5: Piece.pawn(Color.Black)}),
          BuiltMap<PieceType, int>(),
          BuiltMap<PieceType, int>());

      var newShogi = Shogi(newPosition, BuiltList<Position>([]));

      expect(shogi.drop(F4R5, PieceType.Pawn), newShogi);
    });

    test('mate', () {
      position = Position(
          Color.White,
          BuiltMap({
            F5R1: Piece.king(Color.White),
            F5R2: Piece.gold(Color.Black),
            F5R3: Piece.pawn(Color.Black)
          }),
          BuiltMap<PieceType, int>(),
          BuiltMap<PieceType, int>());

      shogi = Shogi(position, BuiltList<Position>([]));
      var status = GameOver(Color.Black, GameOverType.Mate);

      expect(shogi.status(), status);
    });

    test('resign', () {
      var newShogi = shogi.resign();
      var newStatus = GameOver(Color.White, GameOverType.Resign);

      expect(newShogi.status(), newStatus);
    });

    test('timeout', () {
      var newShogi = shogi.timeout();
      var newStatus = GameOver(Color.White, GameOverType.Timeout);

      expect(newShogi.status(), newStatus);
    });

    test('status', () {
      expect(shogi.status(), Playing(Color.Black));
    });
  });
}
