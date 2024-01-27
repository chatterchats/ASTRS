/*
	 * Authors: Chatter and M3ales
	 * calls getRadioData with false to _radioData to get Short Range data if any and checks to make sure it is not empty
	 * Loads _radioData to currently equipped SR.
	 * Outputs "Loaded SR Settings" in a hint as an indication of what was done.
	 * 
	 *
	 * Arguments:
	 * 0: _showResult (optional): if true will display a message at the top right using ace_common_fnc_displayTextPicture on success
	 *
	 * Return Value:
	 * 0 if successful, 1 if error
	 *
	 * Example:
	 * call CHTR_TFAR_Setter_fnc_loadLRSettings
	 *
	 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];

LOG("Loading SR Settings");
_radioData = [false, false] call FUNC(getRadioData);
if (count _radioData == 0) exitWith {
	if (_showResult) then {
		["Failed to load empty SR Settings, try setting them first", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
	};
	LOG_ERROR("Cannot load empty SR Settings");
	1
};
[(call TFAR_fnc_activeSwRadio), _radioData] call TFAR_fnc_setSwSettings;
LOG(format["Loaded SR Settings: %1", _radioData]);
if (_showResult) then {
	["Loaded SR Settings", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
};
0