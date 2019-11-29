/*
 * Authors: Chatter and M3ales
 * Saves current Short Range radio data to _radioData,
 * Pushes _radioData to setRadioData with FALSE to save Short Range data.
 * Outputs "Saved SR Settings" in a hint as an indication of what was done.
 * 
 *
 * Arguments:
 * _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 *
 * Return Value:
 * None
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
[3, _radioData] call FUNC(setRadioData);
<<<<<<< HEAD
=======

>>>>>>> vehicleTesting

if(_showResult) then {
	["Saved SR Settings", QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
};
//check it saved correctly, return result
0