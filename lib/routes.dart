import 'package:flutter/material.dart';
import 'package:songbird/view/artist_view.dart';
import 'package:songbird/view/auth_view.dart';
import 'package:songbird/view/home_view.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    HomeView.routeName: (context) => const HomeView(),
    ArtistView.routeName: (context) => const ArtistView(),
    AuthView.routeName: (context) => const AuthView(),
  };
}
