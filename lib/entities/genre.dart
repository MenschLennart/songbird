class Genre {
  final String genreId;
  final String type;
  final String href;
  final String name;

  Genre(
      {required this.genreId,
      required this.type,
      required this.href,
      required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
        genreId: json['id'],
        type: json['type'],
        href: json['href'],
        name: json['attributes']['name']);
  }
}
