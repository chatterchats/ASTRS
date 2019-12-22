/*
 * Author: M3ales
 * Gets either LR or SR radio data from the settings array and returns it
 *
 * Arguments:
 * 0: LR, SR, or vehicleLR (2, 3, 5) (default:2) <INTEGER>
 *
 * Return Value:
 * TFAR Radio Data <ARRAY>
 *
 * Example:
 * [true] call CHTR_TFAR_Setter_fnc_getRadioData
 *
 * Public: No
 */
#include "function_macros.hpp"
params[
	["_radio", 2, [1.0]]
];

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;

if(_radio = 3) then {
	LOG("Fetching SR Radio Data");
	}else if(_radio = 2) then {
		LOG("Fetching LR Radio Data");
	}else{
		LOG("Fetching Vehicle LR Radio Data");
};

_currentProfile select _index;