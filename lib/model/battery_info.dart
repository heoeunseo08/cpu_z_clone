enum BatteryHealth {
  good(title: "Good"),
  failed(title: "Failed"),
  dead(title: "Dead"),
  overvoltage(title: "Overvoltage"),
  overheated(title: "Overheated"),
  unknown(title: "Unknown")
  ;

  final String title;

  const BatteryHealth({required this.title});
}

enum ChargerConnection {
  none(title: "None"),
  ac(title: "AC charger")
  ;

  final String title;

  const ChargerConnection({required this.title});
}

enum BatteryStatus {
  notCharging(title: "Not charging"),
  full(title: "Full"),
  unknown(title: "Unknown"),
  charging(title: "Charging"),
  disCharging(title: "DisCharging")
  ;

  final String title;

  const BatteryStatus({required this.title});
}

class BatteryInfo {
  final BatteryHealth health;
  final int level;
  final ChargerConnection powerSource;
  final BatteryStatus status;
  final String technology;
  final double temperature;
  final int voltage;

  BatteryInfo({
    required this.health,
    required this.level,
    required this.powerSource,
    required this.status,
    required this.technology,
    required this.temperature,
    required this.voltage,
  });
}
