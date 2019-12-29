#define ADDON CHTR_TFAR_Setter
#define ADDON_NAME ACE TFAR Radio Setter
#define FUNC(name) ADDON##_fnc_##name
#define QUOTE(target) #target
#define FUNCTION_PATH ADDON##\functions
#define ICON_PATH(icon_name) ADDON##\ui\##icon_name##.paa
#define COMPILE_FILE(name) compile preprocessFileLineNumbers 'ADDON\##name##.sqf'
#define GVAR(name) ADDON##_##name
#define ARR_2(a,b) a, b
#define ARR_3(a,b,c) a, b, c
#define ARR_4(a,b,c,d) a, b, c, d
#define ARR_5(a,b,c,d,e) a, b, c, d, e