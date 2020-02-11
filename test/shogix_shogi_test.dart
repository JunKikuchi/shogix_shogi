import 'package:shogix_shogi/shogi.dart';
import 'package:test/test.dart';

void main() {
  group('Shogi', () {
    Position position;
    Shogi shogi;

    setUp(() {
      position = Position(Color.Black, {Square.F5R5: Piece.pawn(Color.Black)},
          {PieceType.Pawn: 1}, {});

      shogi = Shogi(position);
    });

    test('movables', () {
      var movables = Movables({
        Square.F5R5: {Square.F5R4: Promotable.No}
      });

      expect(shogi.movables(), movables);
    });

    test('droppables', () {
      var squares = <Square>{};
      for (var file in File.values) {
        if (file == File.F5) {
          continue;
        }
        for (var rank in Rank.values) {
          squares.add(Square(file, rank));
        }
      }

      var droppables = Droppables({
        {PieceType.Pawn}: squares
      });

      expect(shogi.droppables(), droppables);
    });

    test('move', () {
      var newPosition = Position(Color.White,
          {Square.F5R4: Piece.pawn(Color.Black)}, {PieceType.Pawn: 1}, {});

      var newShogi = Shogi(newPosition);

      expect(shogi.move(Move(Square.F5R4, Square.F5R5, false)), newShogi);
    });

    test('drop', () {
      var newPosition = Position(Color.White, {
        Square.F5R5: Piece.pawn(Color.Black),
        Square.F4R5: Piece.pawn(Color.Black)
      }, {}, {});

      var newShogi = Shogi(newPosition);

      expect(shogi.drop(Drop(Square.F4R5, PieceType.Pawn)), newShogi);
    });

    test('mate', () {
      position = Position(Color.White, {
        Square.F5R1: Piece.king(Color.White),
        Square.F5R2: Piece.gold(Color.Black),
        Square.F5R3: Piece.pawn(Color.Black)
      }, {}, {});

      shogi = Shogi(position);
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
