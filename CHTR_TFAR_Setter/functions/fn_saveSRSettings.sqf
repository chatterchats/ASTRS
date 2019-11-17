/*
 * Authors: Chatter and M3ales
 * Gets the active LR Radio of the Player(TFAR_fnc_activeLrRadio)
 * Sets the profileNamespace variable "CHTR_TFAR_QoL_SettingsLR" to have the settings of current raido by calling "TFAR_fnc_getLrSettings"
 * Outputs "SaveLR Settings" as an indication of what was done.
 * 
 * Debugging option is on line 26, and outputs what was grabbed and stored in "_settings". Simply uncomment to enable, comment it out to disable.
 *      Default: Disabled
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CHTR_TFAR_fnc_saveLRSettings
 *
 * Public: No
 */
#include "function_macros.hpp"

_settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
profileNamespace setVariable [QUOTE(PROFILESETTINGS_SR) , _settings];
["Saved SR Settings", QUOTE(ICON_PATH(interact_root))] call ace_common_fnc_displayTextPicture;
//	systemChat format["%1", _settings];