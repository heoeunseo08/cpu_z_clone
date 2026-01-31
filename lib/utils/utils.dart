import 'package:flutter/material.dart';

class Utils {
  static final primary = Color(0xffAE8AEA);
  static final background = Color(0xff121212);


  static ThemeData appTheme() {
    return ThemeData(
      colorScheme: .fromSeed(seedColor: Colors.black),
      primaryColor: primary,
      scaffoldBackgroundColor: background
    );
  }
}
