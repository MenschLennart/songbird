import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[500],

  // AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 20,
  ),

  // Card
  cardTheme: const CardTheme(
    color: Colors.white24,
    elevation: 3,
    margin: EdgeInsets.all(20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(24.0),
      ),
    ),
  ),

  // BottomNavigationBar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.transparent,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(
      color: Colors.black,
      opacity: 0.3,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black,
      opacity: 1,
    ),
  ),
);
