

/*[// Show or hide LR settings
    "ACE TFAR Radio Setter", 
    "CHECKBOX", // setting type
    "Show", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Long Range", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [TRUE], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        profileNamespace setVariable ["lrOption", _VALUE];
    } 
] call cba_settings_fnc_init;*/

["CHTR_TFAR_LROption", "CHECKBOX", ["LR Load/Save On", "Turn Off/On ability to set LR"], "ACE TFAR Radio Setter", true, nil, {params [["_value", FALSE]]; profileNamespace setVariable ["lrOption", _value]; diag_log "Setting Changed";}] call cba_settings_fnc_init;

/* [// Show or hide SR settings
    "ACE TFAR Radio Setter",
    "CHECKBOX", // setting type
    "Show", // Pretty name shown inside the ingame settings menu. 
    "Short Range", // Pretty name of the category where the setting can be found. 
    [TRUE], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
       	profileNamespace setVariable ["srOption", _VALUE];
    } 
] call cba_settings_fnc_init;
*/

