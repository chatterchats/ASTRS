_settings = profileNamespace getVariable ["arf_setter_settings", _settings];
     [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, _settings] call TFAR_fnc_setLrSettings;
    systemChat "Loaded LR Settings";
	systemChat format["%1", _settings];