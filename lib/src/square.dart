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

enum File { F1, F2, F3, F4, F5, F6, F7, F8, F9 }

enum Rank { R9, R8, R7, R6, R5, R4, R3, R2, R1 }
