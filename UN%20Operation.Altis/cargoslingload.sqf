huron1_cargo = getSlingLoad huron1;
huron2_cargo = getSlingLoad huron2;

sleep 5;

loopcheckslingloadcargo1 = [] spawn
{
	while {true} do
	{
		waitUntil { sleep 5; player in huron1 };
		huron1_cargo = getSlingLoad huron1;
		sleep 5;
	};
};

loopcheckslingloadcargo2 = [] spawn
{
	while {true} do
	{
		waitUntil { sleep 5; player in huron2 };
		huron2_cargo = getSlingLoad huron2;
		sleep 5;
	};
};

loop_huron1_slingload_true = [] spawn {
	while {true} do
	{	
		waitUntil { sleep 5; player in huron1 && !(huron1_cargo isEqualTo objNull) };

		if ((huron1_cargo isEqualTo cargocontainer_1) || (huron1_cargo isEqualTo cargocontainer_2) || (huron1_cargo isEqualTo cargocontainer_3)) then {
			["tskMain1_tsk1","SUCCEEDED"] call BIS_fnc_taskSetState;
			["tskMain2_tsk1","ASSIGNED"] call BIS_fnc_taskSetState;
			sleep 5;
		};
		if ((huron1_cargo isEqualTo mediccontainer_1) || (huron1_cargo isEqualTo mediccontainer_2) || (huron1_cargo isEqualTo mediccontainer_3)) then {
			["tskMain3_tsk1","SUCCEEDED"] call BIS_fnc_taskSetState;
			["tskMain4_tsk1","ASSIGNED"] call BIS_fnc_taskSetState;
			sleep 5;
		};
		sleep 5;
	};
};

loop_huron2_slingload_true = [] spawn {
	while {true} do
	{	
		waitUntil { sleep 5; player in huron2 && !(huron2_cargo isEqualTo objNull) };

		if ((huron2_cargo isEqualTo cargocontainer_1) || (huron2_cargo isEqualTo cargocontainer_2) || (huron2_cargo isEqualTo cargocontainer_3)) then {
			["tskMain1_tsk1","SUCCEEDED"] call BIS_fnc_taskSetState;
			["tskMain2_tsk1","ASSIGNED"] call BIS_fnc_taskSetState;
			sleep 5;
		};	
		if ((huron2_cargo isEqualTo mediccontainer_1) || (huron2_cargo isEqualTo mediccontainer_2) || (huron2_cargo isEqualTo mediccontainer_3)) then {
			["tskMain3_tsk1","SUCCEEDED"] call BIS_fnc_taskSetState;
			["tskMain4_tsk1","ASSIGNED"] call BIS_fnc_taskSetState;
			sleep 5;
		};
		sleep 5;
	};
};

loop_huron1_slingload_false = [] spawn {
	while {true} do
	{	
		waitUntil { sleep 10; player in huron1 && huron1_cargo isEqualTo objNull };
		if (!("tskMain2_tsk1" call BIS_fnc_taskCompleted)) then {
			["tskMain2_tsk1","CREATED"] call BIS_fnc_taskSetState;
			sleep 5;
		};
		if (!("tskMain4_tsk1" call BIS_fnc_taskCompleted)) then {
			["tskMain4_tsk1","CREATED"] call BIS_fnc_taskSetState;
		};
		sleep 5;
	};
};

loop_huron2_slingload_false = [] spawn {
	while {true} do
	{	
		waitUntil { sleep 10; player in huron2 && huron2_cargo isEqualTo objNull };
		if (!("tskMain2_tsk1" call BIS_fnc_taskCompleted)) then {
			["tskMain2_tsk1","CREATED"] call BIS_fnc_taskSetState;
			sleep 5;
		};
		if (!("tskMain4_tsk1" call BIS_fnc_taskCompleted)) then {
			["tskMain4_tsk1","CREATED"] call BIS_fnc_taskSetState;
		};
		sleep 5;
	};
};

loop_taskstatecheck_supply = [] spawn {
	while {true} do
	{	
		waitUntil { sleep 5; alive player };
		tsk1_State = ["tsk1"] call BIS_fnc_taskState;
		tskMain1_tsk1_State = ["tskMain1_tsk1"] call BIS_fnc_taskState;
		tskMain2_tsk1_State = ["tskMain2_tsk1"] call BIS_fnc_taskState;
		tskMain3_tsk1_State = ["tskMain3_tsk1"] call BIS_fnc_taskState;
		tskMain4_tsk1_State = ["tskMain4_tsk1"] call BIS_fnc_taskState;
		tskOpt1_tsk1_State = ["tskOpt1_tsk1"] call BIS_fnc_taskState;
	};
};
