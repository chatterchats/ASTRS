#include "function_macros.hpp"
params[["_index", 0, [0]], ["_value", true, [true, false]]];
if(_index < 0 || _index > 2) exitWith {
	LOG_ERROR(format["Index %1 out of range at fnc_setPrefs.sqf", _index]);
	[]
};
if(count GVAR(Settings) == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};
_prefs = GVAR(Settings) select GVAR(Profile) select 4;
if(count _prefs == 0) then {
	LOG("Init Prefs");
	_prefs = [true, true, false];
};

_prefs set [_index, _value];
LOG(format["Prefs updated to: %1", _prefs])