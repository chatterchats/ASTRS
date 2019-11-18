#include "function_macros.hpp"
params[["_lr", true, [true, false]]];

if(count GVAR(Settings) == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};

if(_lr) then {
	_index = 2;
}else {
	_index = 3;
};

GVAR(Settings) select GVAR(Profile) select _index