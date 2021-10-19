import 'package:flutter/material.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/entities/genre.dart';

class HomeModel extends ChangeNotifier {
  HomeModel() : super();

  int bottomBarTabIndex = 0;

  List<Artist> getArtists() {
    return <Artist>[
      Artist('Adele', Genre.pop),
      Artist('Michael Jackson', Genre.pop),
      Artist('Madonna', Genre.pop),
      Artist('Ben Böhmer', Genre.electronic),
    ];
  }

  void setTabIndex(int index) {
    bottomBarTabIndex = index;
    notifyListeners();
  }
}
