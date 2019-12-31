/*
 * Authors: Chatter and M3ales
 * Calls loadLRSettings and loadSRSettings to load both radios.
 * Outputs "Loaded LR and SR Settings" in a hint as an indication of what was done.
 * 
 *
 * Arguments:
 * _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call CHTR_TFAR_Setter_fnc_loadBothSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];
LOG("Loading all relevant settings");

//determine what we have
_vlr = if(vehicle player != player) then {(vehicle player) call TFAR_fnc_hasVehicleRadio} else {false};
_sr = call TFAR_fnc_haveSWRadio;
_lr = if(count (player call TFAR_fnc_backpackLR) != 0) then {true} else {false};

_results = [-1,-1,-1];
_attempts = [];
if(_sr) then {
	_attempts pushBack "SR";
	_results set [0, [false] call FUNC(loadSRSettings)];
};
if(_lr) then {
	_attempts pushBack "LR";
	_results set [1, [false] call FUNC(loadLRSettings)];
};
if(_vlr) then {
	_attempts pushBack "VLR";
	_results set [2, [false, true] call FUNC(loadLRSettings)];
};
LOGF_2("Loaded settings for %1 with results: %2", _attempts joinString ", ", _results);
if(1 in _results) then {
	//errors, handle
	_msg = if(0 in _results) then {"Loaded settings for %1, but %2 failed."} else {"Failed to load settings. Attempted: %1, Failed: %2"};
	_success = [];
	_fail = [];
	{
		if(_x == 1) then {
			_fail pushBack (_attempts select _foreachIndex);
		}else {
			if (_x == 0) then {
				_success pushBack (_attempts select _foreachIndex);
			};
		};
	}forEach _results;
	_successOrAttempts = if(0 in _results)then{_success}else{_attempts};
	LOGF_2(_msg, _successOrAttempts joinString ", ", _fail joinString ", ");
	[format[_msg, _successOrAttempts joinString ", ", _fail joinString ", "], QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
}else {
	[format["Loaded Settings for %1", _attempts joinString ", "], QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
};