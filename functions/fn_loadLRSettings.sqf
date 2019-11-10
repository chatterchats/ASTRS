/*
 * Author: CI-C Chatter and CI Mirror
 * Gets the active LR Radio of the Player(call TFAR_fnc_activeLrRadio)
 * Sets the  radio to have the settings of arf_setter_settings by loading them from the private variable of "_settings"
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

_settings = profileNamespace getVariable ["arf_setter_settings", _settings];
     [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, _settings] call TFAR_fnc_setLrSettings;
    ["Loaded LR Settings", "CHTR_TFAR_QoL\ui\lrsettings_root.paa"] call ace_common_fnc_displayTextPicture;
//	systemChat format["%1", _settings];