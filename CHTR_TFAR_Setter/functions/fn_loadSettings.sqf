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