import 'package:cpu_z_clone/screen/home.dart';
import 'package:cpu_z_clone/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Utils.appTheme(),
      home: HomeScreen(),
    )
  );
}