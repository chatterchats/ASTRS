#define ADDON CHTR_TFAR_Setter
#define ADDON_NAME ACE TFAR Radio Setter
#define FUNC(name) ADDON##_fnc_##name
#define QUOTE(target) #target
#define FUNCTION_PATH ADDON##\functions
#define ICON_PATH(icon_name) ADDON##\ui\##icon_name##.paa
#define COMPILE_FILE(name) compile preprocessFileLineNumbers 'ADDON\##name##.sqf'