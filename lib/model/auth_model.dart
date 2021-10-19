import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  AuthModel() : super();

  bool loggedIn = false;

  bool validateLoginData() {
    return false;
  }
}
