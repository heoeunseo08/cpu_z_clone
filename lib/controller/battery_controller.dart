import 'dart:async';

import 'package:cpu_z_clone/model/battery_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

final batteryController = BatteryController();

class BatteryController extends ChangeNotifier {
  BatteryInfo? batteryStatus;

  BatteryInfo? get status => batteryStatus;

  static const EventChannel _healthChannel = EventChannel(
    "com.example.cpu_z_clone/battery/health",
  );
  static const EventChannel _levelChannel = EventChannel(
    "com.example.cpu_z_clone/battery/level",
  );
  static const EventChannel _powerSourceChannel = EventChannel(
    "com.example.cpu_z_clone/battery/powerSource",
  );
  static const EventChannel _statusChannel = EventChannel(
    "com.example.cpu_z_clone/battery/status",
  );
  static const EventChannel _technologyChannel = EventChannel(
    "com.example.cpu_z_clone/battery/technology",
  );
  static const EventChannel _temperatureChannel = EventChannel(
    "com.example.cpu_z_clone/battery/temperature",
  );
  static const EventChannel _voltageChannel = EventChannel(
    "com.example.cpu_z_clone/battery/voltage",
  );

  StreamSubscription? _healthSub;
  StreamSubscription? _levelSub;
  StreamSubscription? _powerSourceSub;
  StreamSubscription? _statusSub;
  StreamSubscription? _technologySub;
  StreamSubscription? _temperatureSub;
  StreamSubscription? _voltageSub;

  BatteryHealth? _health;
  int? _level;
  ChargerConnection? _powerSource;
  BatteryStatus? _status;
  String? _technology;
  double? _temperature;
  int? _voltage;

  void initialize() {
    _healthSub = _healthChannel.receiveBroadcastStream().listen((event) {
      _health = parseHealth(event.toString());
      _rebuild();
    });
    _levelSub = _levelChannel.receiveBroadcastStream().listen((event) {
      _level = event as int;
      _rebuild();
    });
    _powerSourceSub = _powerSourceChannel.receiveBroadcastStream().listen((
      event,
    ) {
      _powerSource = parseChargerConnection(event.toString());
      _rebuild();
    });
    _statusSub = _statusChannel.receiveBroadcastStream().listen((event) {
      _status = parseStatus(event.toString());
      _rebuild();
    });
    _technologySub = _technologyChannel.receiveBroadcastStream().listen((
      event,
    ) {
      _technology = event.toString();
      _rebuild();
    });
    _temperatureSub = _temperatureChannel.receiveBroadcastStream().listen((
      event,
    ) {
      _temperature = event as double;
      _rebuild();
    });
    _voltageSub = _voltageChannel.receiveBroadcastStream().listen((event) {
      _voltage = event as int;
      _rebuild();
    });
  }

  @override
  void dispose() {
    _healthSub?.cancel();
    _levelSub?.cancel();
    _powerSourceSub?.cancel();
    _statusSub?.cancel();
    _technologySub?.cancel();
    _temperatureSub?.cancel();
    _voltageSub?.cancel();
    super.dispose();
  }

  void _rebuild() {
    if (_health == null ||
        _level == null ||
        _powerSource == null ||
        _status == null ||
        _temperature == null ||
        _voltage == null)
      return;
    batteryStatus = BatteryInfo(
      health: _health!,
      level: _level!,
      powerSource: _powerSource!,
      status: _status!,
      technology: _technology!,
      temperature: _temperature!,
      voltage: _voltage!,
    );
    notifyListeners();
  }

  BatteryHealth parseHealth(dynamic event) {
    try {
      return switch (event.toString()) {
        'good' => BatteryHealth.good,
        'failed' => BatteryHealth.failed,
        'dead' => BatteryHealth.dead,
        'overvoltage' => BatteryHealth.overvoltage,
        'overheated' => BatteryHealth.overheated,
        _ => BatteryHealth.unknown,
      };
    } catch (e) {
      return BatteryHealth.unknown;
    }
  }

  ChargerConnection parseChargerConnection(dynamic event) {
    try {
      return switch (event.toString()) {
        'ac' => ChargerConnection.ac,
        _ => ChargerConnection.none,
      };
    } catch (e) {
      return ChargerConnection.none;
    }
  }

  BatteryStatus parseStatus(dynamic event) {
    try {
      return switch (event.toString()) {
        'notCharging' => BatteryStatus.notCharging,
        'full' => BatteryStatus.full,
        'charging' => BatteryStatus.charging,
        'disCharging' => BatteryStatus.disCharging,
        _ => BatteryStatus.unknown,
      };
    } catch (e) {
      return BatteryStatus.unknown;
    }
  }
}
