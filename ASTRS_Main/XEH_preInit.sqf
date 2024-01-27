#include "functions\function_macros.hpp"

LOG("Loading Settings");
_settings = call FUNC(loadSettings);
_profileIndex = (_settings select 0) + 1;
_numProfiles = (count _settings)-1;

LOG(format["'%1' Profiles Loaded", _numProfiles]);

// not >= since it increments 1 larger than usual
if (_profileIndex < 1 || _profileIndex > count _settings) then {
	// 1 is effectively 0, but select 0 is profileIndex not profile
	_profileIndex = 1;
	_settings set [0, _profileIndex];
};

_currentProfile = _settings select _profileIndex;

LOG("Profile Loaded: " + str _currentProfile);

LOG("Creating CBA Addon Options");

_srShowRun = {
	params [["_value", false]];
	[0, _value] call FUNC(setPrefs);
	LOG("SR Setting Changed");
};

_lrShowRun = {
	params [["_value", false]];
	[1, _value] call FUNC(setPrefs);
	LOG("LR Setting Changed");
};

_vlrShowRun = {
	params [["_value", false]];
	[2, _value] call FUNC(setPrefs);
	LOG("VLR Setting Changed");
};

_shortcutEnabledRun = {
	params [["_value", false]];
	[4, _value] call FUNC(setPrefs);
	LOG("ShortcutEnabled Setting Changed");
};

_lrDefault = [] call FUNC(showLRCheck);
_vlrDefault = [] call FUNC(showVLRCheck);
_srDefault = [] call FUNC(showSRCheck);
_shortcutEnabled = [] call FUNC(shortcutEnabledCheck);

[
	QUOTE(GVAR(Shortcut)), "CHECKBOX",
	["Enable Load Shortcuts", "Turn Off/On ability to use root lr/sr icon to load settings"],
	["ASTRS Settings", "Preferences"],
	_shortcutEnabled, 0, _shortcutEnabledRun
] call cba_settings_fnc_init;

[
	QUOTE(GVAR(ShowVLR)), "CHECKBOX",
	["VLR Load/Save On", "Turn Off/On ability to set Vehicle LR"],
	["ASTRS Settings", "Preferences"], _vlrDefault, 0, _vlrShowRun
] call cba_settings_fnc_init;

[
	QUOTE(GVAR(ShowLR)), "CHECKBOX",
	["LR Load/Save On", "Turn Off/On ability to set LR"],
	["ASTRS Settings", "Preferences"], _lrDefault, 0, _lrShowRun
] call cba_settings_fnc_init;

[
	QUOTE(GVAR(ShowSR)), "CHECKBOX",
	["SR Load/Save On", "Turn Off/On ability to set SR"],
	["ASTRS Settings", "Preferences"], _srDefault, 0, _srShowRun
] call cba_settings_fnc_init;

/*
	LR Radio Data Array:
	    0: active channel <NUMBER>
	    1: Volume <NUMBER>
	    2: Frequencies for channels <ARRAY>
	    3: Stereo setting : Range (0, 2) (0 - Both, 1 - Left, 2 - Right) <NUMBER>
	    4: Encryption code <STRING>
	    5: Additional active channel <NUMBER>
	    6: Additional active channel stereo mode <NUMBER>
	    7: Empty <nil>
	    8: speaker mode <NUMBER>
	    9: turned on <BOOL>
*/

LOG("PreInit Complete");