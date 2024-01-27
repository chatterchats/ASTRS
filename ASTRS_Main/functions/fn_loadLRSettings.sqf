/*
	 * Authors: Chatter and M3ales
	 * calls getRadioData with true to _radioData to get Long Range data if any and checks to make sure it is not empty
	 * Loads _radioData to currently equipped SR.
	 * Outputs "Loaded SR Settings" in a hint as an indication of what was done.
	 * 
	 *
	 * Arguments:
	 * 0: _showResult (optional): if true will display a message at the top right using ace_common_fnc_displayTextPicture on success
	 * 1: _vlr (optional): default is false. if true, indicates function is run for vehicle Long Range
	 * Return Value:
	 * None
	 *
	 * Example:
	 * [true] call CHTR_TFAR_Setter_fnc_loadLRSettings
	 *
	 * Public: No
 */
#include "function_macros.hpp"

params[
	["_showResult", true, [true]],
	["_vlr", false, [true]]
];

_type = if (_vlr) then {
	"VLR"
} else {
	"LR"
};
_targetLR = if (_vlr) then {
	player call TFAR_fnc_vehicleLR
} else {
	player call TFAR_fnc_backpackLR
};

_radioData = [true, _vlr] call FUNC(getRadioData);
LOGF_2("Loading %1 Settings: %2", _type, _radioData);

if (count _radioData == 0) exitWith {
	LOG_ERRORF_1("Cannot load empty radioData for %1", _type);
	if (_showResult) then {
		[format["Failed to load %1 settings, try setting them first", _type], QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
	};
	1
};

if (isClass(configFile >> "CfgPatches" >> "tfar_core")) then {
	// version > 1.0
	[_targetLR, _radioData] call TFAR_fnc_setLrSettings;
} else {
	// version < 1.0
	[_targetLR select 0, _targetLR select 1, _radioData] call TFAR_fnc_setLrSettings;
};

// test if was set correctly
_result = _targetLR call TFAR_fnc_getLrSettings;
if (!(_result isEqualTo _radioData)) exitWith {
	LOG_ERRORF_2("Failed to save VLR Data [Expected: %1 || Result: %2]", _result, _radioData);
	1
};

if (_showResult) then {
	[format["Loaded %1 Settings", _type], QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
};
0