import 'package:flutter/material.dart';
import 'package:songbird/page/artist_page.dart';
import 'package:songbird/page/auth_page.dart';
import 'package:songbird/page/home_page.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (context) => const HomePage(),
    ArtistPage.routeName: (context) => const ArtistPage(),
    AuthPage.routeName: (context) => const AuthPage(),
  };
}
