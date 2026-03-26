package com.example.home_haven

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES



class MainActivity : FlutterActivity(){
    private val CHANNEL = "samples.flutter.dev/battery"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
       if (call.method == "getBatteryInfo") {
                    
            val batteryInfo = getBatteryInfo()  
                    
            result.success(batteryInfo)

        } else {
            result.notImplemented()
        }
    }
  }

    private fun getBatteryInfo(): Map<String, Any> {

        val batteryManager =
            getSystemService(Context.BATTERY_SERVICE) as BatteryManager

      
        val level = batteryManager.getIntProperty(
            BatteryManager.BATTERY_PROPERTY_CAPACITY
        )

        
        val status = batteryManager.getIntProperty(
            BatteryManager.BATTERY_PROPERTY_STATUS
        )

        val isCharging =
            status == BatteryManager.BATTERY_STATUS_CHARGING ||
            status == BatteryManager.BATTERY_STATUS_FULL

       
        val result = HashMap<String, Any>()
        result["level"] = level
        result["isCharging"] = isCharging

        return result
    }

}
