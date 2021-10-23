import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:songbird/entities/album.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/entities/genre.dart';
import 'package:songbird/entities/song.dart';
import 'package:songbird/service/jwt_generator_service.dart';

class AppleMusicService {
  static const storefront = 'us';
  static const baseUrl = 'https://api.music.apple.com/v1/catalog';
  static const genreUrl = "$baseUrl/$storefront/genres";
  static const _songUrl = "$baseUrl/$storefront/songs";
  static const _albumUrl = "$baseUrl/$storefront/albums";
  static const _artistUrl = "$baseUrl/$storefront/artists";

  static AppleMusicService? _instance;
  String? token;

  AppleMusicService._internal() {
    _instance = this;
  }

  static Future<AppleMusicService> initialize() async {
    AppleMusicService appleMusicService = AppleMusicService._internal();
    appleMusicService.token = await JwtGenerator.appleAPISecret();

    return appleMusicService;
  }

  factory AppleMusicService() {
    return _instance ?? AppleMusicService._internal();
  }

  Future<dynamic> _fetchJSON(String url) async {
    final token = _instance!.token;
    final response = await http
        .get(Uri.parse(url), headers: {'Authorization': "Bearer $token"});

    return response.statusCode == 200
        ? json.decode(response.body)
        : throw Exception('');
  }

  Future<Song> fetchSongById(String songId) async {
    final json = await _instance!._fetchJSON("$_songUrl/$songId");
    return Song.fromJson(json['data'][0]);
  }

  Future<List<Genre>> fetchGenres() async {
    final json = await _instance!._fetchJSON(genreUrl);
    final data = json['data'] as List;
    final genres = data.map((genre) => Genre.fromJson(genre));
    return genres.toList();
  }

  Future<Album> fetchAlbumById(String albumId) async {
    final json = await _instance!._fetchJSON("$_albumUrl/$albumId");
    return Album.fromJson(json['data'][0]);
  }

  Future<Artist> fetchArtistById(String artistId) async {
    final json = await _instance!
        ._fetchJSON("$_artistUrl/$artistId?include=albums,songs");
    return Artist.fromJson(json['data'][0]);
  }
}
