/*
	 * Author: M3ales
	 * Sets the current profile to the specified profileIndex, mimimal type checking at present, use with caution
	 *
	 * Arguments:
	 * 0: the index of the profile you want set as current, 0 based <INTEGER>
	 *
	 * Return Value:
	 * None
	 *
	 * Example:
	 * [0] call CHTR_TFAR_Setter_fnc_setProfile
	 *
	 * Public: No
 */
#include "function_macros.hpp"
params[
	["_profileIndex", 0, [0]]
];
if (_profileIndex < 0) exitWith {
	LOG_ERROR("Cannot set profile to index < 0");
};
_settings = FUNC(loadSettings);
if (_profileIndex > (count _settings)-2) exitWith {
	LOG_ERROR(format["Provided index %1 is too large, no profile matches it's index", _profileIndex]);
};
LOG(format["Updating Profile to %1", _profileIndex]);
_settings set [0, _profileIndex];