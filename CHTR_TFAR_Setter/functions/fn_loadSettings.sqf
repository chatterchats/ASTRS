/*
 * Authors: M3ales
 * Loads settings data from public var, usable as reference due to array. Initialises to defaults if unset, and calls legacy copy when initialising.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Reference to _Settings profileNamespace var
 *
 * Example:
 * call CHTR_TFAR_Setter_fnc_loadSettings
 *
 * Public: No
 */
#include "function_macros.hpp"
#include "defaults.hpp"
#define SETTINGS GVAR(Settings)

_settings = profileNamespace getVariable [QUOTE(SETTINGS), false];
if(typeName _settings == typeName false) then {
	LOG(format["%1 is unset", QUOTE(SETTINGS)]);
	profileNamespace setVariable[QUOTE(SETTINGS), []];
	_settings = profileNamespace getVariable [QUOTE(SETTINGS), false];
	if(typeName _settings == typeName false) exitWith {
		LOG_ERROR(format["Failed to set ", QUOTE(SETTINGS)]);
		[]
	}
};

if(count _settings == 0) then {
	LOG("Looking for old radio data");
	LOG("Initialising profileNamespace to defaults");
	_settings append SETTINGS_DEFAULT;
	call FUNC(copyLegacyRadioData);
	if(count _settings == 0) exitWith {
		LOG_ERROR("Failed to intialise profileNamespace to defaults");
		[]
	};
};
_settings