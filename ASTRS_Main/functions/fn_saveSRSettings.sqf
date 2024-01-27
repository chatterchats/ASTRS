/*
	 * Authors: Chatter and M3ales
	 * Saves current Short Range radio data to _radioData, 
	 * Pushes _radioData to setRadioData with false to save Short Range data.
	 * Outputs "Saved SR Settings" in a hint as an indication of what was done.
	 * 
	 *
	 * Arguments:
	 * _showResult (optional): if true will display a message at the top right using ace_common_fnc_displayTextPicture on success
	 *
	 * Return Value:
	 * 0 if successful, 1 if error
	 *
	 * Example:
	 * call CHTR_TFAR_Setter_fnc_saveLRSettings
	 *
	 * Public: No
 */
#include "function_macros.hpp"

params[["_showResult", true, [true]]];

LOG("Saving SR Settings");
_radioData = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
_success = [false, false, _radioData] call FUNC(setRadioData);

// check it saved correctly, return result

if (_showResult) then {
	if (!_success) exitWith {
		["Failed to Save SR Settings", QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
		LOG_ERROR("Failed to save SR Settings");
		1
	};
	["Saved SR Settings", QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
	LOG("Saved SR Settings Successfully");
};
0