import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/cubit/battery/battery_cubit.dart';
import 'package:home_haven/presentation/cubit/battery/battery_state.dart';

class BatteryPage extends StatelessWidget {
  const BatteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BatteryCubit()..fetchBattery(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Battery Details"),
          centerTitle: true,
        ),
        body: BlocBuilder<BatteryCubit, BatteryState>(
          builder: (context, state) {
            
            if (state is BatteryLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BatteryLoaded) {
              return _buildContent(context, state);
            }

            if (state is BatteryError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, BatteryLoaded state) {
    final int level = state.level;
    final bool isCharging = state.isCharging;

    // 🎨 Color logic
    Color batteryColor;
    if (level <= 15) {
      batteryColor = Colors.red;
    } else if (level <= 20) {
      batteryColor = Colors.orange;
    } else {
      batteryColor = Colors.green;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // 🔋 Battery + Icon Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Battery UI
            Stack(
             clipBehavior: Clip.none,
              children: [
                // Outer battery
                Container(
                  width: 200,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),

                   // Fill based on level
                   child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Container(
                      // duration: const Duration(milliseconds: 400),
                      width: 200 * (level / 100),
                      height: 78,
                      decoration: BoxDecoration(
                        color: batteryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),

               

                // Battery tip
                Positioned(
                  right:-10,
                  top: 25,
                  child: Container(
                    width: 10,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 20),

            // ⚡ Charging Icon
            Icon(
              isCharging ? Icons.flash_on : Icons.power,
              size: 40,
              color: isCharging ? Colors.green : Colors.grey,
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Percentage Text
        Text(
          "$level%",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 40),

        // 🔄 Refresh Button
        ElevatedButton.icon(
          onPressed: () {
            context.read<BatteryCubit>().fetchBattery();
          },
          icon: const Icon(Icons.refresh),
          label: const Text("Refresh"),
        ),
      ],
    );
  }
}