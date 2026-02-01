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
            isScrollable: true,
            labelStyle: TextStyle(
                color: Color(0xffAE8AEA),
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
            unselectedLabelStyle:TextStyle(
                color: Color(0xffA6A6A6),
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
            indicatorColor: Color(0xff3303AD),
            indicatorSize: TabBarIndicatorSize.tab,
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
          backgroundColor: AppColor.background,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text('cpu_z'),
        ),
      ),
    );
  }
}
