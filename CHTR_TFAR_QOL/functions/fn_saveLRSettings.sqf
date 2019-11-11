/*
 * Authors: Chatter and M3ales
 * Gets the active LR Radio of the Player(TFAR_fnc_activeLrRadio)
 * Sets the profileNamespace variable "CHTR_TFAR_QoL_SettingsLR" to have the settings of current raido by calling "TFAR_fnc_getLrSettings"
 * Outputs "SaveLR Settings" as an indication of what was done.
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
 * call CHTR_TFAR_fnc_saveLRSettings
 *
 * Public: No
 */
 
_settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
profileNamespace setVariable ["CHTR_TFAR_QoL_SettingsLR", _settings];
["Saved LR Settings", "CHTR_TFAR_QoL\ui\lrsettings_root.paa"] call ace_common_fnc_displayTextPicture;
//	systemChat format["%1", _settings];