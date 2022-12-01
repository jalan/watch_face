import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class basicView extends WatchUi.WatchFace {

	function initialize() {
		WatchFace.initialize();
	}

	// Load your resources here
	function onLayout(dc as Dc) as Void {
		setLayout(Rez.Layouts.WatchFace(dc));
	}

	// Called when this View is brought to the foreground. Restore
	// the state of this View and prepare it to be shown. This includes
	// loading resources into memory.
	function onShow() as Void {
	}

	// Update the view
	function onUpdate(dc as Dc) as Void {

		// Read settings
		var color = Application.Properties.getValue("Color");

		// Clock
		{
			var clockTime = System.getClockTime();
			var hour = clockTime.hour;
			if (!System.getDeviceSettings().is24Hour) {
				hour = hour%12;
				if (hour == 0) {
					hour = 12;
				}
			}
			var timeString = hour + ":" + clockTime.min.format("%02d");
			var view = View.findDrawableById("TimeLabel") as Text;
			view.setColor(color);
			view.setText(timeString);
		}

		// Battery
		{
			var batteryPercent = System.getSystemStats().battery.toNumber();
			var view = View.findDrawableById("BatteryLabel") as Text;
			view.setText(batteryPercent.format("%d") + "%");
		}

		View.onUpdate(dc);
	}

	// Called when this View is removed from the screen. Save the
	// state of this View here. This includes freeing resources from
	// memory.
	function onHide() as Void {}

	// The user has just looked at their watch. Timers and animations may be started here.
	function onExitSleep() as Void {}

	// Terminate any active timers and prepare for slow updates.
	function onEnterSleep() as Void {}
}
