/*
 * Authors: Chatter and M3ales
 * Gets the active LR Radio of the Player(call TFAR_fnc_activeLrRadio)
 * Sets the  radio to have the settings of CHTR_TFAR_QoL_SettingsLR by loading them from the private variable of "_settings"
 * Outputs "Loaded LR Settings" as an indication of what was done.
 * 
 * Debugging option is on line 18, and outputs what was grabbed and stored in "_settings". Simply uncomment to enable, comment it out to disable.
 *      Default: Disabled
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CHTR_TFAR_fnc_loadLRSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

_settings = profileNamespace getVariable QUOTE(PROFILESETTINGS_LR);
_settings = profileNamespace getVariable [QUOTE(PROFILESETTINGS_LR), []];
[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, _settings] call TFAR_fnc_setLrSettings;
["Loaded LR Settings", QUOTE(ICON_PATH(load))] call ace_common_fnc_displayTextPicture;
//	systemChat format["%1", _settings];