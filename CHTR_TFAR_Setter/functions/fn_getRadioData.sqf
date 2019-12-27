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
#include "defaults.hpp"
params[
	["_lr", true, [true]],
	["_vlr", false, [true]]
];

_settings = call FUNC(loadSettings); // Loads out Settings Dump
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};
_profileIndex = (_settings select CURRENTPROFILE_INDEX) + 1;
_currentProfile = _settings select _profileIndex;

LOG("Testing LR/SR Radio Get");
if(!_lr && !_vlr) exitWith {
	LOG("Getting SR Radio Data");
	_currentProfile select SRDATA_INDEX
}
if(_lr || _vlr) exitWith {
	LOG("Testing VLR or LR Radio Get");
	_current = call TFAR_fnc_activeLRRadio; //current active radioChannelAdd
	_lrProfile = _currentProfile select LRDATA_INDEX;
	_lrIndex = LR_INDEX;

	if(!_vlr) then {
		LOG("Getting LR Radio Data");
	} else {
		LOG("Getting VLR Radio Data");
		_lrIndex = VLR_INDEX;
		_vehicle = call TFAR_fnc_vehicleLR; //Get current vehicle's radio
		if (_current != _vehicle) then {
			_vehRadio call TFAR_fnc_setActiveLRRadio; //swap to vehicle lr to edit
		};
	};
	_lrProfile select _lrIndex;
	_current call TFAR_fnc_setActiveLRRadio; //swap back to original radio
};
LOG_ERROR("Attempted to load Vehicle Short Range - Unsupported Operation");
[]