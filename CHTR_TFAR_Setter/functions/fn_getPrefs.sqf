#include "function_macros.hpp"
#include "defaults.hpp"
params[["_index", 0, [0]]];
if(_index < 0 || _index > 2) exitWith {
	LOG_ERROR(format["Index %1 out of range at fnc_getPrefs.sqf", _index]);
	[]
};
_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;

_prefs = _currentProfile select PREFS_INDEX;
if(count _prefs == 0) then {
	LOG("Prefs empty, Initialising to defaults");
	_prefs append PREFS_DEFAULT;
};

_prefs select _index