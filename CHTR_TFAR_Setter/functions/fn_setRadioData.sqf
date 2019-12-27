/*
 * Author: M3ales
 * Sets LR/SR data of current profile
 *
 * Arguments:
 * 0: LR, SR, or vehicleLR (2, 3, 5) (default:2) <INTEGER>
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
	["_radio", 2, [1.0]],
	["_value", [], [[]]]
];

/*if(_radio = 3) then {
	LOG("Pushing SR Radio Data");
}else if(_radio = 2 ) then {
	LOG("Pushing LR Radio Data");
}else{
	LOG("Pushing Vehicle LR Radio Data");
};*/

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;
_currentProfile set [_radio, _value];
