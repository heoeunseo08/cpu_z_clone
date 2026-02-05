import 'package:cpu_z_clone/controller/battery_controller.dart';
import 'package:cpu_z_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  @override
  void initState() {
    super.initState();
    batteryController.initialize();
    batteryController.addListener(_onBatteryUpdate);
  }

  void _onBatteryUpdate() => setState(() {});

  @override
  void dispose() {
    batteryController.removeListener(_onBatteryUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final status = batteryController.status;

    if (status == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Utils.buildSession(
            name: "Health",
            value: status.health.title,
          ),
          Utils.buildSession(
            name: "Level",
            value: "${status.level} %",
          ),
          Utils.buildSession(
            name: "Power Source",
            value: status.powerSource.title,
          ),
          Utils.buildSession(
            name: "Status",
            value: status.status.title,
          ),
          Utils.buildSession(
            name: "Technology",
            value: status.technology,
          ),
          Utils.buildSession(
            name: "Temperature",
            value: "${status.temperature} ℃",
          ),
          Utils.buildSession(
            name: "Voltage",
            value: "${status.voltage} mV",
          ),
        ],
      ),
    );
  }

}
