/*
 * Author: M3ales
 * Sets LR/SR data of current profile
 *
 * Arguments:
 * 0: LR or SR, LR is true (default:true) <BOOLEAN>
 * 1: Data to be saved (default: []) <ARRAY>
 * Return Value:
 * None
 *
 * Example:
 * [true, []] call CHTR_TFAR_Setter_fnc_setRadioData
 *
 * Public: No
 */
#include "function_macros.hpp"

params[
	["_lr", true, [true]],
	["_value", [], [[]]]
];

_index = 2;
if(!_lr) then {
	LOG("Saving SR Radio Data");
	_index = 3;
}else
{
	LOG("Saving LR Radio Data");
};

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;
_currentProfile set [_index, _value];