import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class basicApp extends Application.AppBase {

	function initialize() {
		AppBase.initialize();
	}

	function onStart(state as Dictionary?) as Void {}

	function onStop(state as Dictionary?) as Void {}

	function getInitialView() as Array<Views or InputDelegates>? {
		return [new basicView()] as Array<Views or InputDelegates>;
	}
}

function getApp() as basicApp {
	return Application.getApp() as basicApp;
}
