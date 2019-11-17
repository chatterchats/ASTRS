/*
 * Authors: Chatter and M3ales
 * Gets the active LR Radio of the Player(call TFAR_fnc_activeLrRadio)
 * Sets the  radio to have the settings of CHTR_TFAR_QoL_SettingsLR by loading them from the private variable of "_settings"
 * Outputs "Loaded LR Settings" as an indication of what was done.
 * 
 *
 * Arguments:
 * _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 *
 * Return Value:
 * None
 *
 * Example:
 * call CHTR_TFAR_Setter_fnc_loadLRSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];

_resultLR = [false] call FUNC(loadLRSettings);
_resultSR = [false] call FUNC(loadSRSettings);
if(_resultLR == 0 && _resultSR == 0) then {
	diag_log "Loaded LR and SR successfully";
	if(_showResult) then {
		["Loaded LR and SR Settings", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
};

_resultLR + _resultSR