import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  HomeModel() : super();

  int bottomBarTabIndex = 0;

  void setTabIndex(int index) {
    bottomBarTabIndex = index;
    notifyListeners();
  }
}
