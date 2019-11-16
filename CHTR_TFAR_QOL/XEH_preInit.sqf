#include "config_macros.hpp"
[// Show or hide LR settings
    "ACE TFAR Radio Setter", 
    "CHECKBOX", // setting type
    "Show", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Long Range", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [TRUE], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        profileNamespace setVariable ["lrOPtion", _VALUE];
    } 
] call cba_settings_fnc_init;

/* [// Show or hide SR settings
    "ACE TFAR Radio Setter",
    "CHECKBOX", // setting type
    "Show", // Pretty name shown inside the ingame settings menu. 
    "Short Range", // Pretty name of the category where the setting can be found. 
    [TRUE], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
       	profileNamespace setVariable ["srOPtion", _VALUE];
    } 
] call cba_settings_fnc_init;
*/
["Test_Setting_1", "CHECKBOX", ["-test checkbox-", "-tooltip-"], "My Category", true] call cba_settings_fnc_init;
//Testing Status from CBA Documentation that SHOULD WORK DAMNIT
