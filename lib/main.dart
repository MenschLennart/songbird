import 'package:flutter/material.dart';
import 'package:songbird/routes.dart';
import 'package:songbird/service/apple_music_service.dart';
import 'package:songbird/theme.dart';
import 'package:songbird/view/auth_view.dart';

void main() {
  runApp(const Songbird());
}

class Songbird extends StatelessWidget {
  const Songbird({Key? key}) : super(key: key);

  boot() async {
    AppleMusicService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize Application
    boot();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Songbird',
      theme: darkTheme,
      routes: Routes.routes,
      home: const AuthView(),
    );
  }
}
