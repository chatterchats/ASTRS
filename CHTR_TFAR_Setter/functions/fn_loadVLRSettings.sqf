/*
 * Authors: Chatter and M3ales
 * calls getRadioData with true to _radioData to get Vehicle Long Range data if any and checks to make sure it is not empty
 * Loads _radioData to currently equipped SR.
 * Outputs "Loaded SR Settings" in a hint as an indication of what was done.
 * 
 *
 * Arguments:
 * _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call CHTR_TFAR_Setter_fnc_loadLRSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];

LOG("Loading LR Settings");
_radioData = [5] call FUNC(getRadioData);
if(count _radioData == 0) exitWith {
	LOG_ERROR("Cannot load unset LR settings");
	1
};
[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, _radioData] call TFAR_fnc_setLrSettings;
LOG(format["Loading Vehicle LR Settings: %1", _radioData]);
if(_showResult) then {
	["Loaded Vehicle LR Settings", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
};
0