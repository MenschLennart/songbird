import 'package:flutter/material.dart';
import 'package:songbird/view/auth_view.dart';
import 'package:songbird/view/home_view.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    'home': (context) => HomeView(),
    'auth': (context) => const AuthView(),
  };
}
