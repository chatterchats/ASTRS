class CfgPatches
{
	class MIRA_TFAR
	{
		name = "TFAR LR Settings";
		author = "Chatter";
		url = "https://github.com/M3ales/MIRA_mods";
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class MIRA_TFAR{
        class TFARLRSettings{
            tag = "MIRA_TFAR";
            requiredAddons[]={};
            file="MIRA_TFAR\functions";
			class loadLRSettings{};
			class saveLRSettings{};
        };
	};
};

class CfgVehicles
{
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class MIRA_TFAR {
				displayName="LR Settings";
				showDisabled=0;
				exceptions[]=
					{
						"isNotInside",
						"isNotSwimming",
						"isNotSitting"
					};
				condition = "call TFAR_fnc_haveLRRadio";
				runOnHover=0;
				icon="MIRA_TFAR\ui\arf.paa";
				class MIRA_saveLRSettings
				{
					displayName="Save";
					statement="call MIRA_TFAR_fnc_saveLRSettings";
				};
				class MIRA_loadLRSettings
				{
					displayName="Load";
					statement="call MIRA_TFAR_fnc_loadLRSettings";
				};
            };
        };
    };
};