import 'package:cpu_z_clone/screen/home.dart';
import 'package:cpu_z_clone/utils/utils.dart';
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


/*
# Wake Up Motion
STK33F11 Auto Brightness Sensor
VDIS Gyroscope
Flip Cover Detector
LSM6DSVTR Accelerometer Uncalibrated
Pocket Mode
Pocket Position Mode
Sequential Step
STK33F11 Light IR
SuperSteady Gyroscope
Device Orientataion Wake Up
SBM
Light Seamless Sensor
Led Cover Event Sensor
Drop Classifier
Touch Procximity
Samsung Hall IC
STK6D2X Rear AlS
Palm Proximity Sensor version 2
Motion Sensor
 */