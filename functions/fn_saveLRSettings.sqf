 _settings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
    profileNamespace setVariable ["arf_setter_settings", _settings];
    systemChat "Saved LR Settings";
	systemChat format["%1", _settings];