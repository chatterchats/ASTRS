/*
 * Author: M3ales
 * Sets VLR/LR/SR data of current profile
 *
 * Arguments:
 * 0: LR or SR, LR is true (default:true) <BOOLEAN>
 * 1: LR or VLR, VLR is true (default: false) <BOOLEAN>
 * 2: Data to be saved (default: []) <ARRAY>
 
 * Return Value:
 * True if successful, false if unsuccessful
 *
 * Example:
 * [false, []] call CHTR_TFAR_Setter_fnc_setRadioData - SR
 * [true, []] call CHTR_TFAR_Setter_fnc_setRadioData - LR
 * [true, true, []] call CHTR_TFAR_Setter_fnc_setRadioData - VLR
 *
 * Public: No
 */
#include "function_macros.hpp"
#include "defaults.hpp"
params[
	["_lr", true, [true]],
	["_vlr", false, [true]],
	["_value", [], [[]]]
];

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	false
};
_profileIndex = (_settings select CURRENTPROFILE_INDEX) + 1;
_currentProfile = _settings select _profileIndex; //Selects profile

LOG("Testing LR/SR Radio Set");
if(!_lr && !_vlr) exitWith {
	LOG("Saving SR Radio Data");
	_currentProfile set [SRDATA_INDEX, _value];
	true
};
if(_lr || _vlr) exitWith {
	_current = call TFAR_fnc_getActiveLR; //current active radio
	_lrProfile = _currentProfile select LRDATA_INDEX; //DATA = LR/SR
	_lrIndex = LR_INDEX; //different LR_INDEX, this one refers to LR/VLR not LR/SR
	LOG("Testing VLR or LR Radio Get");
	if(!_vlr) then {
		LOG("Saving LR Radio Data");
	} else {
		LOG("Saving Vehicle LR Data");

		_vehicle = call TFAR_fnc_vehicleLR; //current vehicle's radio
		_lrIndex = VLR_INDEX;

		if (_current != _vehicle) {
			_vehRadio call TFAR_fnc_setActiveLRRadio; //swap to vehicle lr to edit
		};
	};
	_lrProfile set [_lrIndex, _value];
	_current call TFAR_fnc_setActiveLRRadio; //swap back to original radio
	true
};
LOG_ERROR("Unsupported Operation -- Cannot save Vehicle Short Range Radio");
false