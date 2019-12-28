/*
 * Authors: Chatter and M3ales
 * Saves current Long Range radio data to _radioData,
 * Pushes _radio data to setRadioData with TRUE to save Long Trange
 * Outputs "Saved SR Settings" in a hint as an indication of what was done.
 * 
 *
 * Arguments:
 * _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 *
 * Return Value:
 * 0 if successful, 1 if error
 *
 * Example:
 * [true] call CHTR_TFAR_Setter_fnc_saveLRSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

params[
	["_showResult", true, [true]],
	["_vlr", false, [true]]
];
_type = "LR";
LOG("Grabbing LR Settings from radio");
_radioData = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
if(_vlr) then {
	_type = "VLR";
	_radioData = (player call TFAR_fnc_vehicleLR) call TFAR_fnc_getLrSettings;
};
LOG(format["Saving %1 Settings", _type]);
_success = [true, _vlr, _radioData] call FUNC(setRadioData);

if(_showResult) then {
	if(!_success) exitWith {
		[format["Failed to save %1 Settings", _type], QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
		if(_vlr) then { LOG_ERROR("Cannot load empty radioData for VLR"); }
		else { LOG_ERROR("Cannot load empty radioData for LR"); };
		1
	};
	[format["Saved %1 Settings", _type], QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
};
0