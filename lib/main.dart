import 'package:flutter/material.dart';
import 'package:songbird/routes.dart';
import 'package:songbird/theme.dart';
import 'package:songbird/view/auth_view.dart';

void main() {
  runApp(const Songbird());
}

class Songbird extends StatelessWidget {
  const Songbird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Songbird',
      theme: darkTheme,
      routes: Routes.routes,
      home: const AuthView(),
    );
  }
}
