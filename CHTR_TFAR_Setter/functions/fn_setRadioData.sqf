/*
 * Author: M3ales
 * Sets VLR/LR/SR data of current profile
 *
 * Arguments:
 * 0: LR or SR, LR is true (default:true) <BOOLEAN>
 * 1: LR or VLR, VLR is true (default: false) <BOOLEAN>
 * 2: Data to be saved (default: []) <ARRAY>
 
 * Return Value:
 * None
 *
 * Example:
 * [false, []] call CHTR_TFAR_Setter_fnc_setRadioData - SR
 * [true, []] call CHTR_TFAR_Setter_fnc_setRadioData - LR
 * [true, true, []] call CHTR_TFAR_Setter_fnc_setRadioData - VLR
 *
 * Public: No
 */
#include "function_macros.hpp"

params[
	["_lr", true, [true]],
	["_vlr", false, [true]],
	["_value", [], [[]]]
];

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex; //Selects profile


_index = 2; // (V)LR Index
_lrProfile = 0;
_lrIndex = 0;
LOG(QUOTE(_lr));
LOG("Testing LR/SR Radio Set");
if(!_lr) then {
	LOG("Saving SR Radio Data");
	_index = 3; // SR Index
	_currentProfile set [_index, _value];
	LOG(QUOTE(_currentProfile));
} else {
	_lrProfile = _currentProfile select _index;
	LOG(QUOTE(_vlr));
	LOG("Testing VLR or LR Radio Get");
	if(!_vlr) then {
		LOG("Saving LR Radio Data");
		_lrIndex = 0;
	} else {
		LOG("Saving Vehicle LR Data");
		_lrIndex = 1;
	};
	_lrProfile set [_lrIndex, _value];
}; 


