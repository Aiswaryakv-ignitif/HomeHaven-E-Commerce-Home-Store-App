import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/screens/battery/battery_services.dart';
import 'battery_state.dart';


class BatteryCubit extends Cubit<BatteryState> {
  BatteryCubit() : super(BatteryInitial());

  Future<void> fetchBattery() async {
    emit(BatteryLoading());

    try {
      final result = await BatteryService.getRawBatteryInfo();

      emit(
        BatteryLoaded(
          level: result['level'],
          isCharging: result['isCharging'],
        ),
      );
    } catch (e) {
      emit(BatteryError("Failed to fetch battery info"));
    }
  }
}