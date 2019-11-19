#include "function_macros.hpp"
params[
	["_profileIndex", 0, [0]]
];
if(_profileIndex < 0) exitWith {
	LOG_ERROR("Cannot set profile to index < 0");
};
_settings = FUNC(loadSettings);
if(_profileIndex > (count _settings)-2) exitWith {
	LOG_ERROR(format["Provided index %1 is too large, no profile matches it's index", _profileIndex]);
};
LOG(format["Updating Profile to %1", _profileIndex]);
_settings set [0, _profileIndex];