import 'song.dart';
import 'album.dart';

class Artist {
  final String artistId;
  final String type;
  final String href;
  final String name;
  String imageRawUrl = '';

  final List<Song> songs;
  final List<Album> albums;

  Artist({
    required this.artistId,
    required this.type,
    required this.href,
    required this.name,
    required this.imageRawUrl,
    required this.songs,
    required this.albums,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    final List<Song> songs = [];
    final List<Album> albums = [];

    final relationshipJSON = json['relationships'];
    if (relationshipJSON != null) {
      final songsJSON = relationshipJSON['songs'];
      if (songsJSON != null) {
        songs.addAll((songsJSON['data'] as List).map((s) => Song.fromJson(s)));
      }

      final albumJSON = relationshipJSON['albums'];
      if (albumJSON != null) {
        albums
            .addAll((albumJSON['data'] as List).map((s) => Album.fromJson(s)));
      }
    }

    return Artist(
        artistId: json['id'],
        type: json['type'],
        href: json['href'],
        name: json['attributes']['name'],
        imageRawUrl: '',
        albums: albums,
        songs: songs);
  }
}
