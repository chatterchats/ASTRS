/*
 * Author: M3ales
 * Gets VLR/LR/SR radio data from the settings array and returns it
 *
 * Arguments:
 * 0: LR if true, SR if False <BOOLEAN>
 * 1: VLR if True, Above if False <BOOLEAN>
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
	["_lr", true, [true]],
	["_vlr", false, [true]]
];

_settings = call FUNC(loadSettings); // Loads out Settings Dump
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;

_index = 2;
LOG("Testing LR/SR Radio Get");
if(!_lr) then {
	LOG("Getting SR Radio Data");
	_index = 3;
	_currentProfile select _index;
} else {
	LOG("Testing VLR or LR Radio Get");

	_current = call TFAR_fnc_ActiveLRRadio; //current active radio
	_lrIndex = 0;
	_lrProfile = _currentProfile select _index;

	if(!_vlr) then {
		LOG("Getting LR Radio Data");
		_lrProfile select _lrIndex;
	} else {
		LOG("Getting Vehicle LR Data");
		_lrIndex = 1;
		_vehicle = call TFAR_fnc_vehicleLR; //Get current vehicle's radio
		if (_current == _vehicle) then {
		} else {
			_vehRadio call TFAR_fnc_setActiveLRRadio; //swap to vehicle lr to edit
		};
	};
	_lrProfile select _lrIndex;
	_current call TFAR_fnc_setActiveLRRadio; //swap back to original radio
};



