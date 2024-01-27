/*
	 * Authors: Chatter and M3ales
	 * Loads all radio data possible based on the current context ie. Will only attempt to load vlr in a vehicle, 
	 * only load sr when have one etc.
	 * 
	 *
	 * Arguments:
	 * _showResult (optional): if true will display a message at the top right using ace_common_fnc_displayTextPicture reporting the results
	 *
	 * Return Value:
	 * None
	 *
	 * Example:
	 * [true] call CHTR_TFAR_Setter_fnc_loadAllSettings
	 *
	 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];
LOG("Loading all relevant settings");

// determine what we have
_vlr = if (vehicle player != player) then {
	(vehicle player) call TFAR_fnc_hasVehicleRadio
} else {
	false
};
_sr = call TFAR_fnc_haveSWRadio;
_lr = if (count (player call TFAR_fnc_backpackLR) != 0) then {
	true
} else {
	false
};

// attempt and store results of each load
_results = [-1, -1, -1];// -1 = unattempted, 0 = success, 1 = fail
_attempts = [];
if (_sr) then {
	_attempts pushBack "SR";
	_results set [0, [false] call FUNC(loadSRSettings)];
};
if (_lr) then {
	_attempts pushBack "LR";
	_results set [1, [false] call FUNC(loadLRSettings)];
};
if (_vlr) then {
	_attempts pushBack "VLR";
	_results set [2, [false, true] call FUNC(loadLRSettings)];
};
LOGF_2("Loaded settings for %1 with results: %2", _attempts joinString ", ", _results);
// build a readable result string and report to player&log
if (1 in _results) then {
	// errors, handle
	_msg = if (0 in _results) then {
		"Loaded settings for %1, but %2 failed."
	} else {
		"Failed to load settings. Attempted: %1, Failed: %2"
	};
	_success = [];
	_fail = [];
	{
		if (_x == 1) then {
			// index failed
			_fail pushBack (_attempts select _foreachIndex);
		} else {
			if (_x == 0) then {
				// index successful
				_success pushBack (_attempts select _foreachIndex);
			};
		};
	}forEach _results;
	_successOrAttempts = if (0 in _results) then {
		_success
	} else {
		_attempts
	};
	LOGF_2(_msg, _successOrAttempts joinString ", ", _fail joinString ", ");
	if (_showResult) then {
		[format[_msg, _successOrAttempts joinString ", ", _fail joinString ", "], QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
} else {
	// all load attempts successful
	if (_showResult) then {
		[format["Loaded Settings for %1", _attempts joinString ", "], QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
};