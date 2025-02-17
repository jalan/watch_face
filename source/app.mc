import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class app extends Application.AppBase {
	function initialize() {
		AppBase.initialize();
	}

	function getInitialView() as Array<Views or InputDelegates> ? {
		return [new watchFace()] as Array < Views or InputDelegates > ;
	}

	function onStart(state as Dictionary?) as Void {}
	function onStop(state as Dictionary?) as Void {}
}

function getApp() as app {
	return Application.getApp() as app;
}
