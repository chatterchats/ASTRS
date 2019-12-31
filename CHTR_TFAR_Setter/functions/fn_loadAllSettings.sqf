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
_vlr = if(vehicle player != player) then {(vehicle player) call TFAR_fnc_hasVehicleRadio};
_sr = call TFAR_fnc_haveSWRadio;
_lr = if(player call TFAR_fnc_backpackLR != []) then {true} else {false};

_results = [-1,-1,-1];
_str = [];
if(_sr) then {
	_str pushBack "SR";
	_results set [0, [false] call FUNC(loadSRSettings)];
};
if(_lr) then {
	_str pushBack "LR";
	_results set [1, [false] call FUNC(loadLRSettings)];
};
if(_vlr) then {
	_str pushBack "VLR";
	_results set [2, [false, true] call FUNC(loadLRSettings)];
};
LOGF_2("Loaded settings for %1 with results: %2", _str joinString ", ", _results);

_sum = 0;
{
	if(_x != -1) then {
		_sum += _x;
	};
}forEach _results;

if(_sum != 0) then {
	LOG("Loaded All successfully");
	if(_showResult) then {
		["Loaded All Settings", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
}else
{
	LOGF_2("Failed to Load LR(%1) and SR(%2)", _resultLR, _resultSR);
	if(_showResult) then {
		["Failed to load both correctly, ensure both are set before loading", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
};