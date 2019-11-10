class CfgPatches
{
	class CHTR_TFAR_QoL
	{
		name = "TFAR LR Settings";
		author = "Chatter and M3ales";
		url = "https://github.com/RTO-Chatter/CHTR_TFAR_QoL";
		requiredAddons[] = {"ace", "task_force_radio};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class CHTR_TFAR_QoL{
        class TFARLRSettings{
            tag = "CHTR_TFAR_QoL";
            requiredAddons[]={};
            file="CHTR_TFAR_QoL\functions";
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
            class CHTR_TFAR_QoL {
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
				icon="CHTR_TFAR_QoL\ui\lrsettings_root.paa"
				class CHTR_saveLRSettings
				{
					displayName="Save";
					icon="CHTR_TFAR_QoL\ui\lrsettings_save.paa"
					statement="call CHTR_TFAR_QoL_fnc_saveLRSettings";
				};
				class CHTR_loadLRSettings
				{
					displayName="Load";
					icon="CHTR_TFAR_QoL\ui\lrsettings_load.paa"
					statement="call CHTR_TFAR_QoL_fnc_loadLRSettings";
				};
            };
        };
    };
};