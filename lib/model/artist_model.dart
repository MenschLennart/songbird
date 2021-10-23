import 'package:flutter/material.dart';
import 'package:songbird/entities/artist.dart';
import 'package:http/http.dart' as http;
import 'package:songbird/service/apple_music_service.dart';

class ArtistModel extends ChangeNotifier {
  static int width = 300;
  static int height = 300;

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  final List<Artist> _artists = [];
  List<Artist> get artists => _artists;
  AppleMusicService? appleMusicService;

  ArtistModel() {
    initialize();
  }

  void initialize() async {
    await AppleMusicService.initialize()
        .then((value) => appleMusicService = value);

    List<String> fakeArtists = [
      '20044',
      '32940',
      '262836961',
      '794108530',
    ];

    for (int i = 0; i < fakeArtists.length; i++) {
      final String artistId = fakeArtists[i];
      Artist artist = await appleMusicService!.fetchArtistById(artistId);
      add(artist);
    }

    _isLoading = false;
    notify();
  }

  void notify() {
    notifyListeners();
  }

  Future<String> _buildArtistImageUrl(String artistId) async {
    final response = await http
        .get(Uri.parse('https://music.apple.com/de/artist/$artistId'));
    final document = response.body;

    RegExp regEx = RegExp("<meta property=\"og:image\" content=\"(.*png)\"");
    RegExpMatch? match = regEx.firstMatch(document);

    if (match != null) {
      String rawImageUrl = match.group(1) ?? '';
      String imageUrl = rawImageUrl.replaceAll(
          RegExp(r'[\d]+x[\d]+(cw)+'), '${width}x${height}cc');
      return imageUrl;
    }

    throw Exception();
  }

  Future<void> addAll(List<Artist> artists) async {
    for (int i = 0; i < artists.length; i++) {
      artists[i].imageRawUrl = await _buildArtistImageUrl(artists[i].artistId);
    }
    _artists.addAll(artists);
    notify();
  }

  Future<void> add(Artist artist) async {
    try {
      artist.imageRawUrl = await _buildArtistImageUrl(artist.artistId);
      _artists.add(artist);
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
    notify();
  }

  void remove(Artist artist) {
    _artists.remove(artist);
    notify();
  }

  void removeAll() {
    _artists.clear();
    notify();
  }
}
