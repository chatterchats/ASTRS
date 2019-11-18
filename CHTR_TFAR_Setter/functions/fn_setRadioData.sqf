#include "function_macros.hpp"
params[["_lr", true, [true]], ["_value", [], [[]]]];

if(count GVAR(Settings) == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
};

if(_lr) then {
	_index = 2;
}else {
	_index = 3;
};

GVAR(Settings) select GVAR(Profile) set [_index, _value];
_str = format["Updated [LR: %1] to: %2", _lr, _value];
LOG(_str);