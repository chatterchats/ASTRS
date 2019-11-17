#include "functions\function_macros.hpp"
_layoutDefault = call FUNC(layoutOptionCheck);
_lrDefault = call FUNC(layoutOptionCheck);
_srDefault = call FUNC(layoutOptionCheck);
[QUOTE(PROFILESETTINGS_PREF_LAYOUT), "CHECKBOX", ["Alternate Layout", "Change Tree Layout"], "ACE TFAR Radio Setter", _layoutDefault, nil, {params [["_value", false]]; profileNamespace setVariable [QUOTE(PROFILESETTINGS_PREF_LAYOUT) , _value]; diag_log "Layout Setting Changed";}] call cba_settings_fnc_init;
[QUOTE(PROFILESETTINGS_PREF_LR), "CHECKBOX", ["LR Load/Save On", "Turn Off/On ability to set LR"], "ACE TFAR Radio Setter", _lrDefault, nil, {params [["_value", false]]; profileNamespace setVariable [QUOTE(PROFILESETTINGS_PREF_LR) , _value]; diag_log format["LR Setting Changed", profileNamespace getVariable QUOTE(PROFILESETTINGS_PREF_LR)];}] call cba_settings_fnc_init;
[QUOTE(PROFILESETTINGS_PREF_SR), "CHECKBOX", ["SR Load/Save On", "Turn Off/On ability to set SR"], "ACE TFAR Radio Setter", _srDefault, nil, {params [["_value", false]]; profileNamespace setVariable [QUOTE(PROFILESETTINGS_PREF_SR) , _value]; diag_log "SR Setting Changed";}] call cba_settings_fnc_init;