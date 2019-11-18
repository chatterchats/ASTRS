#define HAS_LR call TFAR_fnc_haveLRRadio
#define HAS_SR call TFAR_fnc_haveSWRadio
#define SHOW_LR call FUNC(showSRCheck)
#define SHOW_SR call FUNC(showLRCheck)
#define ALTERNATE_LAYOUT (call FUNC(layoutOptionCheck))

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
							displayName = "Load Both";
							icon = QUOTE(ICON_PATH(interact_root));
							statement = QUOTE([true] call FUNC(loadBothSettings));
							condition = QUOTE(!ALTERNATE_LAYOUT && SHOW_LR && SHOW_SR && HAS_LR && HAS_SR);
					};
					//Original Layout, ALTERNATE_LAYOUT = False
					class LR_Root {
						displayName = "LR";
						icon = QUOTE(ICON_PATH(lr));
						condition = QUOTE(!ALTERNATE_LAYOUT && SHOW_LR && HAS_LR);
						class LR_Load {
							icon = QUOTE(ICON_PATH(load));
							statement = QUOTE([true] call FUNC(loadLRSettings));
							displayName = "Load";
						};
						class LR_Save {
							icon = QUOTE(ICON_PATH(save));
							statement = QUOTE([true] call FUNC(saveLRSettings));
							displayName = "Save";
						};
					};
					//Original Layout, ALTERNATE_LAYOUT = False
					class SR_Root {
						displayName = "SR";
						icon = QUOTE(ICON_PATH(sr));
						condition = QUOTE(!ALTERNATE_LAYOUT && SHOW_SR && HAS_SR);
						class SR_Load {
							icon = QUOTE(ICON_PATH(load));
							statement = QUOTE([true] call FUNC(loadSRSettings));
							displayName = "Load";
						};
						class SR_Save {
							icon = QUOTE(ICON_PATH(save));
							statement = QUOTE([true] call FUNC(saveSRSettings));
							displayName = "Save";
						};
					};
					//New Layout, ALTERNATE_LAYOUT = True
					class Save_Root {
						displayName = "Save";
						statement = "";
						condition = QUOTE(ALTERNATE_LAYOUT);
						icon = QUOTE(ICON_PATH(save));
						class Save_LR {
							displayName = "LR";
							icon = QUOTE(ICON_PATH(lr));
							statement = QUOTE([true] call FUNC(saveLRSettings));
							condition = QUOTE(SHOW_LR && HAS_LR);
						};
						class Save_SR {
							icon = QUOTE(ICON_PATH(sr));
							displayName = "SR";
							statement = QUOTE([true] call FUNC(saveSRSettings));
							condition = QUOTE(SHOW_SR && HAS_SR);
						};
					};
					//New Layout, ALTERNATE_LAYOUT = True
					class Load_Root {
						displayName = "Load";
						icon = QUOTE(ICON_PATH(load));
						statement = "";
						condition = QUOTE(ALTERNATE_LAYOUT);
						class Load_LR {
							displayName = "LR";
							icon = QUOTE(ICON_PATH(lr));
							statement = QUOTE([true] call FUNC(loadLRSettings));
							condition = QUOTE(SHOW_LR && HAS_LR);
						};
						class Load_SR {
							displayName = "SR";
							icon = QUOTE(ICON_PATH(sr));
							statement = QUOTE([true] call FUNC(loadSRSettings));
							condition = QUOTE(SHOW_SR && HAS_SR);
						};
						class Load_Both {
							displayName = "Both";
							icon = QUOTE(ICON_PATH(interact_root));
							statement = QUOTE([true] call FUNC(loadBothSettings));
							condition = QUOTE(SHOW_LR && SHOW_SR && HAS_LR && HAS_SR);
						};
					};
				};
			};
		};
    };
};