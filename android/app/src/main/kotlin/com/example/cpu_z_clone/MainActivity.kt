package com.example.cpu_z_clone

import com.example.cpu_z_clone.battery.BatteryMonitor
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    private lateinit var batteryMonitor: BatteryMonitor

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        batteryMonitor = BatteryMonitor(this)

        //battery
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            batteryHealthChannelName
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink) =
                batteryMonitor.startBatteryHealthMonitor(events)

            override fun onCancel(arguments: Any?) = batteryMonitor.stopBatteryHealthMonitor()
        })
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            batteryLevelChannelName
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink) =
                batteryMonitor.startBatteryLevelMonitor(events)

            override fun onCancel(arguments: Any?) = batteryMonitor.stopBatteryLevelMonitor()
        })
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            batteryPowerSourceChannelName
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink) =
                batteryMonitor.startBatteryPowerSourceMonitor(events)

            override fun onCancel(arguments: Any?) = batteryMonitor.stopBatteryPowerSourceMonitor()
        })
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            batteryStatusChannelName
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink) =
                batteryMonitor.startBatteryStatusMonitor(events)

            override fun onCancel(arguments: Any?) = batteryMonitor.stopBatteryStatusMonitor()
        })
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            batteryTechnologyChannelName
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink) =
                batteryMonitor.startBatteryTechnologyMonitor(events)

            override fun onCancel(arguments: Any?) = batteryMonitor.stopBatteryTechnologyMonitor()
        })
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            batteryTemperatureChannelName
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink) =
                batteryMonitor.startBatteryTemperatureMonitor(events)

            override fun onCancel(arguments: Any?) = batteryMonitor.stopBatteryTemperatureMonitor()
        })
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            batteryVoltageChannelName
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink) =
                batteryMonitor.startBatteryVoltageMonitor(events)

            override fun onCancel(arguments: Any?) = batteryMonitor.stopBatteryVoltageMonitor()
        })
    }

    companion object {
        val batteryHealthChannelName = "com.example.cpu_z_clone/battery/health"
        val batteryLevelChannelName = "com.example.cpu_z_clone/battery/level"
        val batteryPowerSourceChannelName = "com.example.cpu_z_clone/battery/powerSource"
        val batteryStatusChannelName = "com.example.cpu_z_clone/battery/status"
        val batteryTechnologyChannelName = "com.example.cpu_z_clone/battery/technology"
        val batteryTemperatureChannelName = "com.example.cpu_z_clone/battery/temperature"
        val batteryVoltageChannelName = "com.example.cpu_z_clone/battery/voltage"
    }
}