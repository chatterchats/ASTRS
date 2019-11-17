#define hasLR call TFAR_fnc_haveLRRadio
#define hasSR call TFAR_fnc_haveSWRadio
#define showLR call FUNC(showLRCheck)
#define showSR call FUNC(showSRCheck)

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
			class ACE_Equipment {
				class ADDON {
					displayName = "TFAR Setter";
					icon = QUOTE(ICON_PATH(interact_root));
					exceptions[] = {
						"isNotInside",
						"isNotSwimming",
						"isNotSitting",
						"notOnMap"
					};
					class Load_Both {
							displayName = "Both";
							icon = QUOTE(ICON_PATH(interact_root));
							statement = QUOTE(call FUNC(loadSRSettings); call FUNC(loadLRSettings););
							condition = QUOTE(!(call FUNC(layoutOptionCheck)) && showLR && showSR && hasLR && hasSR);
					}
					//Original Layout, PROFILESETTINGS_PREF_LAYOUT = False
					class LR_Root {
						displayName = "LR";
						icon = QUOTE(ICON_PATH(lr));
						condition = QUOTE(showLR && hasLR && !(call FUNC(layoutOptionCheck)));
						class LR_Load{
							icon = QUOTE(ICON_PATH(load));
							statement = QUOTE(call FUNC(loadLRSettings));
							displayName = "Load";
							};
						class LR_Save{
							icon = QUOTE(ICON_PATH(save));
							statement = QUOTE(call FUNC(saveLRSettings));
							displayName = "Save";
							};
						};
					//Original Layout, PROFILESETTINGS_PREF_LAYOUT = False
					class SR_Root {
						displayName = "SR";
						icon = QUOTE(ICON_PATH(sr));
						condition = QUOTE(showSR && hasSR && !(call FUNC(layoutOptionCheck)));
						class SR_Load{
							icon = QUOTE(ICON_PATH(load));
							statement = QUOTE(call FUNC(loadSRSettings));
							displayName = "Load";
							};
						class SR_Save{
							icon = QUOTE(ICON_PATH(save));
							statement = QUOTE(call FUNC(saveSRSettings));
							displayName = "Save";
							};
						};
					//New Layout, PROFILESETTINGS_PREF_LAYOUT = True
					class Save_Root {
						displayName = "Save";
						statement = "";
						condition = QUOTE(call FUNC(layoutOptionCheck));
						icon = QUOTE(ICON_PATH(save));
						class Save_LR {
							displayName = "LR";
							icon = QUOTE(ICON_PATH(lr));
							statement = QUOTE(call FUNC(saveLRSettings));
							condition = QUOTE(showLR && hasLR);
						};
						class Save_SR {
							icon = QUOTE(ICON_PATH(sr));
							displayName = "SR";
							statement = QUOTE(call FUNC(saveSRSettings));
							condition = QUOTE(showSR && hasSR);
						};
					};
					//New Layout, PROFILESETTINGS_PREF_LAYOUT = True
					class Load_Root {
						displayName = "Load";
						icon = QUOTE(ICON_PATH(load));
						statement = "";
						condition = QUOTE(call FUNC(layoutOptionCheck));
						class Load_LR {
							displayName = "LR";
							icon = QUOTE(ICON_PATH(lr));
							statement = QUOTE(call FUNC(loadLRSettings));
							condition = QUOTE(showLR && hasLR);
						};
						class Load_SR {
							displayName = "SR";
							icon = QUOTE(ICON_PATH(sr));
							statement = QUOTE(call FUNC(loadSRSettings));
							condition = QUOTE(showSR && hasSR);
						};
						class Load_Both {
							displayName = "Both";
							icon = QUOTE(ICON_PATH(interact_root));
							statement = QUOTE(call FUNC(loadSRSettings); call FUNC(loadLRSettings););
							condition = QUOTE(showLR && hasSR);
						};
					};
				};
			};
		};
    };
};