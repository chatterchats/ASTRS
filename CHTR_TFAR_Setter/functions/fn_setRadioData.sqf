#include "function_macros.hpp"

params[
	["_lr", true, [true]],
	["_value", [], [[]]]
];

_log = format["Updating Radio (LR: %1) to: %2", _lr, _value];
LOG(_log);

_index = 2;
if(!_lr) then {
	_index = 3;
};

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;
_currentProfile set [_index, _value];