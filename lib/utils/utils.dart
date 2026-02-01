import 'package:flutter/material.dart';

class AppColor {
  static final primary = Color(0xffAE8AEA);
  static final background = Color(0xff121212);
}

class Utils {
  static ThemeData appTheme() {
    return ThemeData(
      colorScheme: .fromSeed(seedColor: Colors.black),
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.background,
    );
  }
}
