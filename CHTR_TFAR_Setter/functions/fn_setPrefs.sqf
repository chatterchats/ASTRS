#include "function_macros.hpp"
params[["_index", 0, [0]], ["_value", true, [true]]];
if(_index < 0 || _index > 2) exitWith {
	LOG_ERROR(format["Index %1 out of range at fnc_setPrefs.sqf", _index]);
	[]
};
if(count GVAR(Settings) == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(Settings) not initialised));
	[]
};
_currentProfile = GVAR(Settings) select GVAR(Profile);
_prefs = _currentProfile select 4;
if(count _prefs == 0) then {
	LOG("Init Prefs");
	_currentProfile set [4, [true, true, false]];
	_prefs = _currentProfile select 4; //ensure that the reference is preserved
};

_prefs set [_index, _value];
LOG(format["Prefs updated to: %1", _prefs]);