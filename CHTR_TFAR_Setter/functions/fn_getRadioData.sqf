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
_profileIndex = (_settings select CURRENTPROFILE_ID) + 1;
_currentProfile = _settings select _profileIndex;

LOG("Testing LR/SR Radio Get");

if(!_lr && !_vlr) exitWith {
	LOG("Getting SR Radio Data");
	_currentProfile select SRDATA_INDEX
};

if(_lr || _vlr) exitWith {
	LOG("Testing VLR or LR Radio Get");
	
	_lrData = _currentProfile select LRDATA_INDEX; // Where LR and VLR info is stored in an array
	_lrIsArrayofArrays = _lrData isEqualTypeArray [[],[]];
	
	if(!(_lrIsArrayofArrays)) then {
		LOG_ERROR("Old settings layout detected");
		_lrNewData = call FUNC(copyLegacyLRData);
		LOG_ERROR("Data Modified into new format");
		_currentProfile set [LRDATA_INDEX, _lrNewData];
		LOG_ERROR("New Format Applied");
		_lrData = _currentProfile select LRDATA_INDEX; 
	};


	_lrIndex = LR_INDEX; // Where LR data is inside the array
	if(_vlr) then {
		LOG("Getting VLR Radio Data");
		_lrIndex = VLR_INDEX; // Where VLR data is inside the array
	};
	
	
	if(count _lrData > 0 ) then { 
		_lrData select _lrIndex; 
	} else { 
		LOG_ERROR("No LR Data for getting. Probably not a good thing"); 
		[] 
	};
};

LOG_ERROR("Attempted to load Vehicle Short Range - Unsupported Operation");
[]