import 'package:flutter/services.dart';

class BatteryService {
  static const MethodChannel _channel =
      MethodChannel('samples.flutter.dev/battery');

  static Future<Map<String, dynamic>> getRawBatteryInfo() async {
    try {
      final result = await _channel.invokeMethod('getBatteryInfo');

      return {
        "level": result['level'],
        "isCharging": result['isCharging'],
      };
    } on PlatformException catch (e) {
      throw Exception("Failed to get battery info: ${e.message}");
    }
  }
}