import 'package:cpu_z_clone/screen/about.dart';
import 'package:cpu_z_clone/screen/battery.dart';
import 'package:cpu_z_clone/screen/device.dart';
import 'package:cpu_z_clone/screen/sensors.dart';
import 'package:cpu_z_clone/screen/soc.dart';
import 'package:cpu_z_clone/screen/system.dart';
import 'package:cpu_z_clone/screen/thermal.dart';
import 'package:cpu_z_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/logo.png', height: 45, width: 45),
                  SizedBox(width: 6),
                  Text(
                    "CPU-Z",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/trophy.png', width: 29, height: 29),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      size: 24,
                      color: Color(0xffA6A6A6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottom: TabBar.secondary(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            padding: EdgeInsets.zero,
            labelStyle: TextStyle(
              color: Color(0xffAE8AEA),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            indicatorColor: Color(0xff3303AD),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            tabs: <Widget>[
              Tab(child: Text("SOC")),
              Tab(child: Text("DEVICE")),
              Tab(child: Text("SYSTEM")),
              Tab(child: Text("BATTERY")),
              Tab(child: Text("THERMAL")),
              Tab(child: Text("SENSORS")),
              Tab(child: Text("ABOUT")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SocScreen(),
            DeviceScreen(),
            SystemScreen(),
            BatteryScreen(),
            ThermalScreen(),
            SensorsScreen(),
            AboutScreen(),
          ],
        ),
      ),
    );
  }
}
