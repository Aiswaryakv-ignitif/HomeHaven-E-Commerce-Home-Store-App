abstract class BatteryState {}

class BatteryInitial extends BatteryState {}

class BatteryLoading extends BatteryState {}

class BatteryLoaded extends BatteryState {
  final int level;
  final bool isCharging;

  BatteryLoaded({
    required this.level,
    required this.isCharging,
  });
}

class BatteryError extends BatteryState {
  final String message;

  BatteryError(this.message);
}