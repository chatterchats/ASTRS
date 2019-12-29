/*
 * Authors: Chatter and M3ales
 * calls getRadioData with true to _radioData to get Long Range data if any and checks to make sure it is not empty
 * Loads _radioData to currently equipped SR.
 * Outputs "Loaded SR Settings" in a hint as an indication of what was done.
 * 
 *
 * Arguments:
 * 0: _showResult (optional): If true will display a message at the top right using ace_common_fnc_displayTextPicture on success
 * 1: _vlr (optional): Default is False. If true, indicates function is run for Vehicle Long Range
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

_type = "LR";
if(_vlr) then {
    _type = "VLR";
};

_backpackLR = player call TFAR_fnc_backpackLR;
_vehicleLR = player call TFAR_fnc_vehicleLR;
_radioData = [true, _vlr] call FUNC(getRadioData);
LOGF_2("Loading %1 Settings: %2",_type,_radioData);

if(count _radioData == 0) exitWith {
    LOG_ERRORF_1("Cannot load empty radioData for %1", _type);
	[format["Failed to load %1 Settings -- Empty", _type], QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
    1
};

if(_vlr) then {
    [_vehicleLR select 0, _vehicleLR select 1, _radioData] call TFAR_fnc_setLrSettings;
    //TODO: Test it actually changed correctly
} else {
    [_backpackLR select 0, _backpackLR select 1, _radioData] call TFAR_fnc_setLrSettings;
    //TODO: Test it actually changed correctly
};

if(_showResult) then {
	[format["Loaded %1 Settings", _type], QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
};
0