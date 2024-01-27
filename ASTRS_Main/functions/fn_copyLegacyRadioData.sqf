/*
	 * Author: M3ales
	 * Copies LR/SR data from the old version of CHTR_TFAR_QoL, also deletes vars (setting to nil) once loaded.
	 *
	 * Arguments:
	 * None
	 *
	 * Return Value:
	 * None
	 *
	 * Example:
	 * call CHTR_TFAR_Setter_fnc_copyLegacyRadioData
	 *
	 * Public: No
 */
#include "function_macros.hpp"
// checks var is both an array and non 0 count
#define IS_SET(varname) typeName varname == typeName [] && count varname != 0
// macros for legacy names
#define LEGACY_SETTINGS_LR "CHTR_TFAR_QoL_SettingsLR"
#define LEGACY_SETTINGS_SR "CHTR_TFAR_QoL_SettingsSR"
// macro to make more readable, will 'delete' variable specified from profileNamespace
#define DELETE_VAR(name) profileNamespace setVariable [name, nil];

LOG("Checking for Legacy Radio Data");
_oldLRData = profileNamespace getVariable [LEGACY_SETTINGS_LR, []];
_oldSRData = profileNamespace getVariable [LEGACY_SETTINGS_SR, []];
if (IS_SET(_oldLRData) || IS_SET(_oldSRData)) then {
	LOG("Legacy Radio Data found");
	if (count _oldLRData != 0) then {
		LOG("Copying Legacy LR Radio Data");
		[true, _oldLRData] call FUNC(setRadioData);
		LOG("Deleting Legacy LR Radio Data");
		DELETE_VAR(LEGACY_SETTINGS_LR);
	};
	if (count _oldSRData != 0) then {
		LOG("Copying Legacy SR Radio Data");
		[false, _oldSRData] call FUNC(setRadioData);
		LOG("Deleting Legacy SR Radio Data");
		DELETE_VAR(LEGACY_SETTINGS_SR);
	};
} else {
	LOG("No Legacy Radio Data found");
};