#include "functions\function_macros.hpp"
[QUOTE(PROFILESETTINGS_PREF_LAYOUT), "CHECKBOX", ["Alternate Layout", "Change Tree Layout"], "ACE TFAR Radio Setter", false, nil, {params [["_value", FALSE]]; profileNamespace setVariable [ QUOTE(PROFILESETTINGS_PREF_LAYOUT) , _value]; diag_log "Layout Setting Changed";}] call cba_settings_fnc_init;
[QUOTE(PROFILESETTINGS_PREF_LR), "CHECKBOX", ["LR Load/Save On", "Turn Off/On ability to set LR"], "ACE TFAR Radio Setter", true, nil, {params [["_value", FALSE]]; profileNamespace setVariable [ QUOTE(PROFILESETTINGS_PREF_LR) , _value]; diag_log "LR Setting Changed";}] call cba_settings_fnc_init;
[QUOTE(PROFILESETTINGS_PREF_SR), "CHECKBOX", ["SR Load/Save On", "Turn Off/On ability to set LR"], "ACE TFAR Radio Setter", true, nil, {params [["_value", FALSE]]; profileNamespace setVariable [ QUOTE(PROFILESETTINGS_PREF_SR) , _value]; diag_log "SR Setting Changed";}] call cba_settings_fnc_init;


diag_log Q_DIAG_LOG_CHECK;