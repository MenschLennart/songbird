import 'package:songbird/entities/genre.dart';

class Artist {
  Artist(this.artistId, this.name, this.genre);

  String artistId;
  String name;
  Genre genre;
}
