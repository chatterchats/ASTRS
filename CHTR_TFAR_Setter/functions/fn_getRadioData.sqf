/*
 * Author: M3ales
 * Gets either LR or SR radio data from the settings array and returns it
 *
 * Arguments:
 * 0: LR if true, SR if False <BOOLEAN>
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
	["_lr", true, [true]]
];

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;

_index = 2;
if(!_lr) then {
	_index = 3;
};

_currentProfile select _index