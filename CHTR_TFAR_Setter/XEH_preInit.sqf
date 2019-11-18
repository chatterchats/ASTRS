#include "functions\function_macros.hpp"

GVAR(Settings) = profileNamespace getVariable [QUOTE(GVAR(Settings)), []];
GVAR(Profile) = profileNamespace getVariable [QUOTE(GVAR(Profile)), -1];

if(GVAR(Profile) == -1) then {
	LOG("No Profile Selected, Defaulting to 0");
	GVAR(Profile) = 0;
};

if(count GVAR(Settings) == 0) then {
	LOG("Initialising profileNamespace Variables");
	_settings = [
		[0, "Default Profile", [], [], []]
	];
	profileNamespace setVariable [QUOTE(GVAR(Settings)), _settings];
	GVAR(Profile) = 0;
	GVAR(Settings) = profileNamespace getVariable [QUOTE(GVAR(Settings)), []];
	LOG[format["Settings set to %1", GVAR(Settings)]];
};

if(count GVAR(Settings) == 0) exitWith {
	LOG_ERROR(QUOTE(Failed to intialise from profileNamespace));
	GVAR(Settings) = [];
};

_layoutDefault = call FUNC(layoutOptionCheck);
_lrDefault = call FUNC(layoutOptionCheck);
_srDefault = call FUNC(layoutOptionCheck);

["ALTERNATE_LAYOUT", "CHECKBOX", ["Alternate Layout", "Change Tree Layout"], "ACE TFAR Radio Setter", call FUNC(layoutOptionCheck), nil, {params [["_value", false]]; [2, _value] call FUNC(setPrefs); LOG("Layout Setting Changed")}] call cba_settings_fnc_init;
["SHOW_LR", "CHECKBOX", ["LR Load/Save On", "Turn Off/On ability to set LR"], "ACE TFAR Radio Setter", call FUNC(showSRCheck), nil, {params [["_value", false]]; [0, _value] call FUNC(setPrefs); , _value]; LOG("LR Setting Changed"))}] call cba_settings_fnc_init;
["SHOW_SR", "CHECKBOX", ["SR Load/Save On", "Turn Off/On ability to set SR"], "ACE TFAR Radio Setter", call FUNC(showLRCheck), nil, {params [["_value", false]]; [1, _value] call FUNC(setPrefs); , _value]; LOG("SR Setting Changed")}] call cba_settings_fnc_init;