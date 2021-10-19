enum Genre {
  pop,
  hiphop,
  electronic,
}

extension GenreExtension on Genre {
  static const genreMap = <Genre, String>{
    Genre.pop: "Pop",
    Genre.electronic: "Electronic",
    Genre.hiphop: "Hip-Hop",
  };

  String get name => genreMap[this]!;
}
