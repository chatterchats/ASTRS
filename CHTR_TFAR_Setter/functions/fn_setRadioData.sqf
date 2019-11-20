#include "function_macros.hpp"

params[
	["_lr", true, [true]],
	["_value", [], [[]]]
];

_index = 2;
if(!_lr) then {
	LOG("Updating SR Radio");
	_index = 3;
}else
{
	LOG("Updating LR Radio");
};

_settings = call FUNC(loadSettings);
if(count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
};
_profileIndex = (_settings select 0) + 1;
_currentProfile = _settings select _profileIndex;
_currentProfile set [_index, _value];