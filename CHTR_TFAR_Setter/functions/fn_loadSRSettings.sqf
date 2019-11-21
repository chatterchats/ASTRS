/*
 * Authors: Chatter and M3ales
 * calls getRadioData with false to _radioData to get Short Range data if any and checks to make sure it is not empty
 * Loads _radioData to currently equipped SR.
 * Outputs "Loaded SR Settings" in a hint as an indication of what was done.
 * 
 *
 * Arguments:
 * 0: _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
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

LOG("Loading SR Settings");
_radioData = [false] call FUNC(getRadioData);
if(count _radioData == 0) exitWith {
	LOG_ERROR("Cannot load unset SR settings");
	1
};
[(call TFAR_fnc_activeSwRadio), _radioData] call TFAR_fnc_setSwSettings;
LOG(format["Loading SR Settings: %1", _radioData]);
if(_showResult) then {
	["Loaded SR Settings", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
};
0