#include "functions\function_macros.hpp"
#define SETTINGS GVAR(Settings)
#define PROFILE GVAR(Profile)

SETTINGS = profileNamespace getVariable [QUOTE(SETTINGS), []];
PROFILE = profileNamespace getVariable [QUOTE(PROFILE), -1];

if(count SETTINGS == 0) then {
	LOG("Initialising profileNamespace Variables");
	_settings = [
		[0, "Default Profile", [], [], []]
	];
	profileNamespace setVariable [QUOTE(SETTINGS), _settings];
	profileNamespace setVariable [QUOTE(PROFILE), 0];
	PROFILE = 0;
	SETTINGS = profileNamespace getVariable [QUOTE(SETTINGS), []];
	LOG(format["Settings set to %1", SETTINGS]);
};

if(count SETTINGS == 0) exitWith {
	LOG_ERROR(QUOTE(Failed to intialise from profileNamespace));
	SETTINGS = [];
};

LOG(format["%1 Profiles Loaded", count SETTINGS]);

if(typeName PROFILE != typeName 0 || PROFILE == -1) then {
	LOG("No Profile Selected, Defaulting to 0");
	PROFILE = 0;
}else
{
	_res = SETTINGS select PROFILE;
	LOG(format["Selected profile: %1 -- %2", PROFILE, _res]);
};

if(PROFILE > count SETTINGS) then {
	_safe = (count SETTINGS) - 1;
	LOG(format["%1 references index larger than size of %2, resolving to %3", QUOTE(PROFILE), QUOTE(SETTINGS), _safe]);
	PROFILE = _safe;
	profileNamespace setVariable [QUOTE(PROFILE), PROFILE];
};

_alternateLayoutRun = {
	params [["_value", false]]; 
	[2, _value] call FUNC(setPrefs);
	LOG("Layout Setting Changed");
};

_lrShowRun = {
	params [["_value", false]];
	[0, _value] call FUNC(setPrefs);
	LOG("LR Setting Changed");
};

_srShowRun = {
	params [["_value", false]];
	[1, _value] call FUNC(setPrefs);
	LOG("SR Setting Changed");
};

_layoutDefault = [] call FUNC(layoutOptionCheck);
_lrDefault = [] call FUNC(showLRCheck);
_srDefault = [] call FUNC(showSRCheck);

_a = [QUOTE(GVAR(Layout)), "CHECKBOX", ["Alternate Layout", "Change Tree Layout"], "ACE TFAR Radio Setter", _layoutDefault, 0, _alternateLayoutRun] call cba_settings_fnc_init;
_b = [QUOTE(GVAR(ShowLR)), "CHECKBOX", ["LR Load/Save On", "Turn Off/On ability to set LR"], "ACE TFAR Radio Setter", _lrDefault, 0, _lrShowRun] call cba_settings_fnc_init;
_c = [QUOTE(GVAR(ShowSR)), "CHECKBOX", ["SR Load/Save On", "Turn Off/On ability to set SR"], "ACE TFAR Radio Setter", _srDefault, 0, _srShowRun] call cba_settings_fnc_init;