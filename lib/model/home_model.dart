import 'package:flutter/material.dart';
import 'package:songbird/entities/artist.dart';
import 'package:songbird/entities/genre.dart';

class HomeModel extends ChangeNotifier {
  HomeModel() : super();

  int bottomBarTabIndex = 0;

  List<Artist> getArtists() {
    return <Artist>[
      Artist('262836961', 'Adele', Genre.pop),
      Artist('32940', 'Michael Jackson', Genre.pop),
      Artist('20044', 'Madonna', Genre.pop),
      Artist('794108530', 'Ben Böhmer', Genre.electronic),
    ];
  }

  void setTabIndex(int index) {
    bottomBarTabIndex = index;
    notifyListeners();
  }
}
