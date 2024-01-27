/*
	 * Author: M3ales
	 * Sets VLR/LR/SR data of current profile
	 *
	 * Arguments:
	 * 0: LR or SR, LR is true (default:true) <BOOLEAN>
	 * 1: LR or VLR, VLR is true (default: false) <BOOLEAN>
	 * 2: Data to be saved (default: []) <ARRAY>
	 
	 * Return Value:
	 * true if successful, false if unsuccessful
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
if (count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	false
};
_profileIndex = (_settings select CURRENTPROFILE_ID) + 1;
_currentProfile = _settings select _profileIndex;// Selects profile
LOGF_2("Reading profile %1 (%2)", _profileIndex, _currentProfile select PROFILEDISPLAYNAME_INDEX);

if (!_lr && !_vlr) exitWith {
	LOG("Saving SR Radio Data");
	_currentProfile set [SRDATA_INDEX, _value];
	true
};
if (_lr || _vlr) exitWith {
	_type = if (_vlr) then {
		"VLR"
	} else {
		"LR"
	};
	_lrIndex = if (_vlr) then {
		VLR_INDEX
	} else {
		LR_INDEX
	};

	LOGF_1("Saving %1 Radio Data", _type);
	_lrData = _currentProfile select LRDATA_INDEX; // Where LR and VLR info is stored in an array
	// Check data array in correct format, cater to legacy option
	_lrIsArrayofArrays = _lrData isEqualTypeArray [[], []];
	if (!(_lrIsArrayofArrays)) then {
		LOG("Old LR Data layout detected, copying to new layout");
		_lrNewData = call FUNC(copyLegacyLRData);
		_currentProfile set [LRDATA_INDEX, _lrNewData];
		LOG("New LR Data Format Applied");
	};

	// Validation block
	if (count _lrData == 0) exitWith {
		LOG_ERRORF_1("_lrData is not set, likely malformed settings data, unable to save %1 data", _type);
		false
	};

	// set lr data
	_lrData set [_lrIndex, _value];

	// return value if successful
	true
};
LOG_ERROR("Unsupported Operation -- Cannot save Vehicle Short Range Radio");
false