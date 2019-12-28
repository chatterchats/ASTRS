#define HAS_LR call TFAR_fnc_haveLRRadio
#define HAS_SR call TFAR_fnc_haveSWRadio
#define HAS_VLR (vehicle player) call TFAR_fnc_hasVehicleRadio
#define SHOW_LR call FUNC(showSRCheck)
#define SHOW_SR call FUNC(showLRCheck)
#define SHOW_VLR true
#define IN_VIC (vehicle player) != player
#define ALTERNATE_LAYOUT (call FUNC(layoutOptionCheck))
#define SHORTCUT_ENABLED call FUNC(shortcutEnabledCheck)


class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
			class ACE_Equipment {
				class ADDON_EXCEPT{
					exceptions[] = {
						"isNotInside",
						"isNotSwimming",
						"isNotSitting",
						"notOnMap"
					};
				};
				class ADDON : ADDON_EXCEPT{
					displayName = "TFAR Setter";
					icon = QUOTE(ICON_PATH(interact_root));

					class Load_Both : ADDON_EXCEPT{
						displayName = "Load Both";
						icon = QUOTE(ICON_PATH(interact_root));
						statement = QUOTE([true] call FUNC(loadBothSettings));
						condition = QUOTE(!ALTERNATE_LAYOUT && SHOW_LR && SHOW_SR && HAS_LR && HAS_SR);
					};
					//Original Layout, ALTERNATE_LAYOUT = False
					class LR_Root : ADDON_EXCEPT{
						displayName = "LR";
						icon = QUOTE(ICON_PATH(lr));
						statement = QUOTE(if(SHORTCUT_ENABLED) then {[true] call FUNC(loadLRSettings)};);
						condition = QUOTE(!ALTERNATE_LAYOUT && SHOW_LR && HAS_LR);
						class LR_Load : ADDON_EXCEPT{
							icon = QUOTE(ICON_PATH(load));
							statement = QUOTE([true] call FUNC(loadLRSettings));
							displayName = "Load";
						};
						class LR_Save : ADDON_EXCEPT{
							icon = QUOTE(ICON_PATH(save));
							statement = QUOTE([true] call FUNC(saveLRSettings));
							displayName = "Save";
						};
					};
					//Original Layout, ALT_LAYOUT = False or something
					class VLR_Root : ADDON_EXCEPT{
						displayName = "VLR";
						icon = QUOTE(ICON_PATH(lr));
						statement = QUOTE(if(SHORTCUT_ENABLED) then {[ARR_2(true, true)] call FUNC(loadLRSettings)};);
						condition = QUOTE(!ALTERNATE_LAYOUT && SHOW_VLR && HAS_VLR);
						class LR_Load : ADDON_EXCEPT{
							icon = QUOTE(ICON_PATH(load));
							statement = QUOTE([ARR_2(true, true)] call FUNC(loadLRSettings));
							displayName = "Load";
						};
						class LR_Save : ADDON_EXCEPT{
							icon = QUOTE(ICON_PATH(save));
							statement = QUOTE([ARR_2(true, true)] call FUNC(saveLRSettings));
							displayName = "Save";
						};
					};
					//Original Layout, ALTERNATE_LAYOUT = False
					class SR_Root : ADDON_EXCEPT{
						displayName = "SR";
						icon = QUOTE(ICON_PATH(sr));
						statement = QUOTE(if(SHORTCUT_ENABLED) then {[true] call FUNC(loadSRSettings)};);
						condition = QUOTE(!ALTERNATE_LAYOUT && SHOW_SR && HAS_SR);
						class SR_Load : ADDON_EXCEPT{
							icon = QUOTE(ICON_PATH(load));
							statement = QUOTE([true] call FUNC(loadSRSettings));
							displayName = "Load";
						};
						class SR_Save : ADDON_EXCEPT{
							icon = QUOTE(ICON_PATH(save));
							statement = QUOTE([true] call FUNC(saveSRSettings));
							displayName = "Save";
						};
					};
					//New Layout, ALTERNATE_LAYOUT = True
					class Save_Root : ADDON_EXCEPT{
						displayName = "Save";
						statement = "";
						condition = QUOTE(ALTERNATE_LAYOUT && (SHOW_LR || SHOW_SR) && (HAS_LR || HAS_SR));
						icon = QUOTE(ICON_PATH(save));
						class Save_LR : ADDON_EXCEPT{
							displayName = "LR";
							icon = QUOTE(ICON_PATH(lr));
							statement = QUOTE([true] call FUNC(saveLRSettings));
							condition = QUOTE(SHOW_LR && HAS_LR);
						};
						class Save_VLR : ADDON_EXCEPT{
							displayName = "VLR";
							icon = QUOTE(ICON_PATH(lr));
							condition = QUOTE(HAS_VLR && SHOW_VLR);
							statement = QUOTE([ARR_2(true,true)] call FUNC(saveLRSettings));
						};
						class Save_SR : ADDON_EXCEPT{
							icon = QUOTE(ICON_PATH(sr));
							displayName = "SR";
							statement = QUOTE([true] call FUNC(saveSRSettings));
							condition = QUOTE(SHOW_SR && HAS_SR);
						};
					};
					//New Layout, ALTERNATE_LAYOUT = True
					class Load_Root : ADDON_EXCEPT{
						displayName = "Load";
						icon = QUOTE(ICON_PATH(load));
						statement = QUOTE(if(SHORTCUT_ENABLED && SHOW_LR && SHOW_SR) then {[true] call FUNC(loadBothSettings)};);
						condition = QUOTE(ALTERNATE_LAYOUT && (HAS_LR || HAS_SR));
						class Load_LR : ADDON_EXCEPT{
							displayName = "LR";
							icon = QUOTE(ICON_PATH(lr));
							statement = QUOTE([true] call FUNC(loadLRSettings));
							condition = QUOTE(SHOW_LR && HAS_LR);
						};
						class Load_VLR : ADDON_EXCEPT{
							displayName = "VLR";
							icon = QUOTE(ICON_PATH(lr));
							condition = QUOTE(HAS_VLR && SHOW_VLR);
							statement = QUOTE([ARR_2(true,true)] call FUNC(loadLRSettings));
						};
						class Load_SR : ADDON_EXCEPT{
							displayName = "SR";
							icon = QUOTE(ICON_PATH(sr));
							statement = QUOTE([true] call FUNC(loadSRSettings));
							condition = QUOTE(SHOW_SR && HAS_SR);
						};
						class Load_Both : ADDON_EXCEPT{
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