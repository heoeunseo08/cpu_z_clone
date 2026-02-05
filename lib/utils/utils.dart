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

  static Widget buildSession({required String name, required String value}) {
    return Container(
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xff303030)),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              value,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
