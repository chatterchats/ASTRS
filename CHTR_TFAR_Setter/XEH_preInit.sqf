#include "functions\function_macros.hpp"

LOG("Loading Settings");
_settings = call FUNC(loadSettings);
_profileIndex = (_settings select 0) + 1;
_numProfiles = (count _settings)-1;

LOG(format["'%1' Profiles Loaded", _numProfiles]);

//not >= since it increments 1 larger than usual
if(_profileIndex < 1 || _profileIndex > count _settings) then { 
	 //1 is effectively 0, but select 0 is profileIndex not profile
	_profileIndex = 1;
	_settings set [0, _profileIndex];
};

_currentProfile = _settings select _profileIndex;

LOG("Profile Loaded: " + str _currentProfile);

LOG("Creating CBA Addon Options");
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
_alternateLayoutRun = {
	params [
		["_value", false]
	]; 
	[2, _value] call FUNC(setPrefs);
	LOG("Layout Setting Changed");
};
_shortcutEnabledRun = {
	params [["_value", false]];
	[3, _value] call FUNC(setPrefs);
	LOG("ShortcutEnabled Setting Changed");
};
_vlrShowRun = {
	params [["_value", false]];
	[4, _value] call FUNC(setPrefs);
	LOG("VLR Setting Changed");
};

_layoutDefault = [] call FUNC(layoutOptionCheck);
_lrDefault = [] call FUNC(showLRCheck);
_vlrDefault = [] call FUNC(showVLRCheck);
_srDefault = [] call FUNC(showSRCheck);
_shortcutEnabled = [] call FUNC(shortcutEnabledCheck);

[QUOTE(GVAR(Layout)), "CHECKBOX", ["Alternate Layout", "Change Tree Layout"], "ACE TFAR Radio Setter", _layoutDefault, 0, _alternateLayoutRun] call cba_settings_fnc_init;
[QUOTE(GVAR(Shortcut)), "CHECKBOX", ["Enable Load Shortcuts", "Turn Off/On ability to use root lr/sr icon to load settings"], "ACE TFAR Radio Setter", _shortcutEnabled, 0, _shortcutEnabledRun] call cba_settings_fnc_init;
[QUOTE(GVAR(ShowVLR)), "CHECKBOX", ["VLR Load/Save On", "Turn Off/On ability to set Vehicle LR"], "ACE TFAR Radio Setter", _vlrDefault, 0, _vlrShowRun] call cba_settings_fnc_init;
[QUOTE(GVAR(ShowLR)), "CHECKBOX", ["LR Load/Save On", "Turn Off/On ability to set LR"], "ACE TFAR Radio Setter", _lrDefault, 0, _lrShowRun] call cba_settings_fnc_init;
[QUOTE(GVAR(ShowSR)), "CHECKBOX", ["SR Load/Save On", "Turn Off/On ability to set SR"], "ACE TFAR Radio Setter", _srDefault, 0, _srShowRun] call cba_settings_fnc_init;

LOG("PreInit Complete");