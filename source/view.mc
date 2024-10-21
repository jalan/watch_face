import Toybox.Activity;
import Toybox.ActivityMonitor;
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.Weather;

class watchFace extends WatchUi.WatchFace {

	function initialize() {
		WatchFace.initialize();
	}

	function onLayout(dc as Dc) as Void {
		setLayout(Rez.Layouts.WatchFace(dc));
	}

	function onUpdate(dc as Dc) as Void {
		var deviceSettings = System.getDeviceSettings();

		// Time
		{
			var view = View.findDrawableById("TimeLabel") as Text;
			var clockTime = System.getClockTime();
			var hour = clockTime.hour;
			if (!deviceSettings.is24Hour) {
				hour = hour % 12;
				if (hour == 0) {
					hour = 12;
				}
			}
			view.setText(hour.toString() + ":" + clockTime.min.format("%02d"));
		}

		// Battery
		{
			var view = View.findDrawableById("BatteryLabel") as Text;
			var batteryPercent = System.getSystemStats().battery.toNumber();
			view.setText(batteryPercent.format("%d") + "%");
		}

		// Date
		{
			var view = View.findDrawableById("DateLabel") as Text;
			var info = Time.Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
			view.setText(info.day_of_week + " " + info.day);
		}

		// Notifications
		{
			var view = View.findDrawableById("NotificationsIconLabel") as Text;
			var notificationCount = deviceSettings.notificationCount;
			var text = "";
			if (notificationCount != 0) {
				text = "💬";
			}
			view.setText(text);

			view = View.findDrawableById("NotificationsCountLabel") as Text;
			text = "";
			if (notificationCount != 0) {
				text = notificationCount.toString();
			}
			view.setText(text);
		}

		// Temperature
		{
			var view = View.findDrawableById("TemperatureLabel") as Text;
			var weatherConditions = Weather.getCurrentConditions();
			var text = "";
			if (weatherConditions != null and weatherConditions.temperature != null) {
				text = (weatherConditions.temperature * 9 / 5 + 32).toString() + "°";
			}
			view.setText(text);
		}

		View.onUpdate(dc);
	}

	function onEnterSleep() as Void {}
	function onExitSleep() as Void {}
	function onHide() as Void {}
	function onShow() as Void {}
}
