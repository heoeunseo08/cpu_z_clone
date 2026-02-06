package com.example.cpu_z_clone.battery

import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel

class BatteryMonitor(private val context: Context) {

    private var batteryHealthHandler: Handler? = null
    private var batteryHealthRunnable: Runnable? = null

    private var batteryLevelHandler: Handler? = null
    private var batteryLevelRunnable: Runnable? = null

    private var batteryPowerSourceHandler: Handler? = null
    private var batteryPowerSourceRunnable: Runnable? = null

    private var batteryStatusHandler: Handler? = null
    private var batteryStatusRunnable: Runnable? = null

    private var batteryTechnologyHandler: Handler? = null
    private var batteryTechnologyRunnable: Runnable? = null

    private var batteryTemperatureHandler: Handler? = null
    private var batteryTemperatureRunnable: Runnable? = null

    private var batteryVoltageHandler: Handler? = null
    private var batteryVoltageRunnable: Runnable? = null

    fun getBatteryIntent(): Intent?{
        return context.registerReceiver(
            null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
    }


    fun startBatteryHealthMonitor(events: EventChannel.EventSink) {
        if (batteryHealthHandler != null) return
        batteryHealthHandler = Handler(Looper.getMainLooper())
        batteryHealthRunnable = object : Runnable {
            override fun run() {
                val health = currentHealth()
                events.success(health)
                batteryHealthHandler?.postDelayed(this, 3000)
            }
        }
        batteryHealthHandler?.post(batteryHealthRunnable!!)
    }

    fun currentHealth(): String {
        val intent = getBatteryIntent()

        val health = intent?.getIntExtra(
            BatteryManager.EXTRA_HEALTH,
            BatteryManager.BATTERY_HEALTH_UNKNOWN
        ) ?: BatteryManager.BATTERY_HEALTH_UNKNOWN

        return when (health) {
            BatteryManager.BATTERY_HEALTH_GOOD -> "good"
            BatteryManager.BATTERY_HEALTH_DEAD -> "dead"
            BatteryManager.BATTERY_HEALTH_OVERHEAT -> "overheated"
            BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE -> "overvoltage"
            else -> "unknown"
        }
    }

    fun stopBatteryHealthMonitor() {
        batteryHealthHandler?.removeCallbacks(batteryHealthRunnable!!)
        batteryHealthHandler = null
        batteryHealthRunnable = null
    }

    fun startBatteryLevelMonitor(events: EventChannel.EventSink) {
        batteryLevelHandler = Handler(Looper.getMainLooper())
        batteryLevelRunnable = object : Runnable {
            override fun run() {
                val level = currentLevel()
                events.success(level)
                batteryLevelHandler?.postDelayed(this, 3000)
            }
        }
        batteryLevelHandler?.post(batteryLevelRunnable!!)
    }

    fun currentLevel(): Int {
        val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(
            BatteryManager.BATTERY_PROPERTY_CAPACITY
        )
    }

    fun stopBatteryLevelMonitor() {
        batteryLevelHandler?.removeCallbacks(batteryLevelRunnable!!)
        batteryLevelHandler = null
        batteryLevelRunnable = null
    }

    fun startBatteryPowerSourceMonitor(events: EventChannel.EventSink) {
        if (batteryPowerSourceHandler != null) return
        batteryPowerSourceHandler = Handler(Looper.getMainLooper())
        batteryPowerSourceRunnable = object : Runnable {
            override fun run() {
                val powerSource = currentPowerSource()
                events.success(powerSource)
                batteryPowerSourceHandler?.postDelayed(this, 3000)
            }
        }
        batteryPowerSourceHandler?.post(batteryPowerSourceRunnable!!)
    }

    fun currentPowerSource(): String {
        val intent = getBatteryIntent()

        val plugged = intent?.getIntExtra(
            BatteryManager.EXTRA_PLUGGED,
            0
        ) ?: 0
        return when (plugged) {
            BatteryManager.BATTERY_PLUGGED_AC -> "ac"
            else -> "none"
        }
    }

    fun stopBatteryPowerSourceMonitor() {
        batteryPowerSourceHandler?.removeCallbacks(batteryPowerSourceRunnable!!)
        batteryPowerSourceHandler = null
        batteryPowerSourceRunnable = null
    }

    fun startBatteryStatusMonitor(events: EventChannel.EventSink) {
        if (batteryStatusHandler != null) return
        batteryStatusHandler = Handler(Looper.getMainLooper())
        batteryStatusRunnable = object : Runnable {
            override fun run() {
                val status = currentStatus()
                events.success(status)
                batteryStatusHandler?.postDelayed(this, 3000)
            }
        }
        batteryStatusHandler?.post(batteryStatusRunnable!!)
    }

    fun currentStatus(): String {
        val intent = getBatteryIntent()

        val status = intent?.getIntExtra(
            BatteryManager.EXTRA_STATUS,
            BatteryManager.BATTERY_STATUS_UNKNOWN
        ) ?: BatteryManager.BATTERY_STATUS_UNKNOWN

        return when (status) {
            BatteryManager.BATTERY_STATUS_FULL -> "full"
            BatteryManager.BATTERY_STATUS_CHARGING -> "charging"
            BatteryManager.BATTERY_STATUS_DISCHARGING -> "discharging"
            BatteryManager.BATTERY_STATUS_NOT_CHARGING -> "notCharging"
            else -> "unknown"
        }
    }

    fun stopBatteryStatusMonitor() {
        batteryStatusHandler?.removeCallbacks(batteryStatusRunnable!!)
        batteryStatusHandler = null
        batteryStatusRunnable = null
    }

    fun startBatteryTechnologyMonitor(events: EventChannel.EventSink) {
        if (batteryTechnologyHandler != null) return
        batteryTechnologyHandler = Handler(Looper.getMainLooper())
        batteryTechnologyRunnable = object : Runnable {
            override fun run() {
                val technology = currentTechnology()
                events.success(technology)
                batteryTechnologyHandler?.postDelayed(this, 3000)
            }
        }
        batteryTechnologyHandler?.post(batteryTechnologyRunnable!!)
    }

    fun currentTechnology(): String {
        val intent = getBatteryIntent()

        return intent?.getStringExtra(BatteryManager.EXTRA_TECHNOLOGY) ?: "Unknown"
    }

    fun stopBatteryTechnologyMonitor() {
        batteryTechnologyHandler?.removeCallbacks(batteryTechnologyRunnable!!)
        batteryTechnologyHandler = null
        batteryTechnologyRunnable = null
    }

    fun startBatteryTemperatureMonitor(events: EventChannel.EventSink) {
        if (batteryTemperatureHandler != null) return
        batteryTemperatureHandler = Handler(Looper.getMainLooper())
        batteryTemperatureRunnable = object : Runnable {
            override fun run() {
                val temperature = currentTemperature()
                events.success(temperature)
                batteryTemperatureHandler?.postDelayed(this, 3000)
            }
        }
        batteryTemperatureHandler?.post(batteryTemperatureRunnable!!)
    }

    fun currentTemperature(): Double {
        val intent = getBatteryIntent()

        val temperature = intent?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, -1) ?: -1
        return temperature / 10.0
    }

    fun stopBatteryTemperatureMonitor() {
        batteryTemperatureHandler?.removeCallbacks(batteryTemperatureRunnable!!)
        batteryTemperatureHandler = null
        batteryTemperatureRunnable = null
    }

    fun startBatteryVoltageMonitor(events: EventChannel.EventSink) {
        if (batteryVoltageHandler != null) return
        batteryVoltageHandler = Handler(Looper.getMainLooper())
        batteryVoltageRunnable = object : Runnable {
            override fun run() {
                val voltage = currentVoltage()
                events.success(voltage)
                batteryVoltageHandler?.postDelayed(this, 3000)
            }
        }
        batteryVoltageHandler?.post(batteryVoltageRunnable!!)
    }

    fun currentVoltage(): Int {
        val intent = getBatteryIntent()

        val voltage = intent?.getIntExtra(BatteryManager.EXTRA_VOLTAGE, -1) ?: -1
        return voltage
    }

    fun stopBatteryVoltageMonitor() {
        batteryVoltageHandler?.removeCallbacks(batteryVoltageRunnable!!)
        batteryVoltageHandler = null
        batteryVoltageRunnable = null
    }
}