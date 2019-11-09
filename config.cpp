class CfgPatches
{
	class MIRA_TFAR
	{
		name = "TFAR LR Settings";
		author = "CI-C Chatter and CI Mirror";
		url = "https://github.com/RTO-Chatter/CHTR_TFAR_QoL";
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class CHTR_TFAR{
        class TFARLRSettings{
            tag = "CHTR_TFAR";
            requiredAddons[]={};
            file="CHTR_TFAR\functions";
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
            class CHTR_TFAR {
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
				class CHTR_saveLRSettings
				{
					displayName="Save";
					statement="call CHTR_TFAR_fnc_saveLRSettings";
				};
				class CHTR_loadLRSettings
				{
					displayName="Load";
					statement="call CHTR_TFAR_fnc_loadLRSettings";
				};
            };
        };
    };
};