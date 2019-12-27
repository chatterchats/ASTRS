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

LOG("Loading LR and SR Settings");
_resultLR = [false] call FUNC(loadLRSettings);
_resultSR = [false] call FUNC(loadSRSettings);
if(_resultLR + _resultSR == 0) then {
	LOG("Loaded LR and SR successfully");
	if(_showResult) then {
		["Loaded LR and SR Settings", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
}else
{
	if(_showResult) then {
		LOG(format["Failed to Load LR(%1) and SR(%2)", _resultLR, _resultSR]);
		["One or More Load Operations Failed", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
};

_resultLR + _resultSR