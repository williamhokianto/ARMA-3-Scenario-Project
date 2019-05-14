deleteVehicle leader_house_trg;
action_id_to_remove pushBack gang_leader_alive_action;
gang_leader call fncRemoveAction;

if (!alive gang_leader) then {
	["tskMain2_1_tsk4","FAILED"] call BIS_fnc_taskSetState;

	[player,["tskMain2_2_tsk4", "tsk4"],["Search the leader body for any possible intel.","Search Body"],[gang_leader],"ASSIGNED",1,true,"SEARCH",true] call BIS_fnc_taskCreate;

	[gang_leader,
	"Search Body",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"player distance gang_leader < 2",
	"player distance gang_leader < 2",
	{
		hint "Searching";
		player playAction "medicStart";
	},
	
	
	{},
	
	{
		hint "Intel Found";
		player playAction "medicStop";
		["tskMain2_2_tsk4","SUCCEEDED"] call BIS_fnc_taskSetState;
		[player,["tskMain3_tsk4", "tsk4"],["According to the intel, there is a weapon storage near Oreokastro, your task is to confirm and secure that weapon storage. There is a police squad waiting for your call nearby the target location if you need some assistance.","Confirm And Secure"],[obj_ammo_cache],"ASSIGNED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;
		{_x hideObject false;
		_x enableSimulation true}
		forEach units bandit1;

		{_x hideObject false;
		_x enableSimulation true}
		forEach units bandit2;

		{_x hideObject false;
		_x enableSimulation true}
		forEach units policesquad_1;

		offroad1 hideObject false;
		offroad1 enableSimulation true;
		offroad2 hideObject false;
		offroad2 enableSimulation true;
		offroad3 hideObject false;
		offroad3 enableSimulation true;
		offroad1G hideObject false;
		offroad1G enableSimulation true;
		"marker_gang_hideout" setMarkerAlpha 1;
		police_radio = [] execVM "radio_police_trigger.sqf";
	},
	
	{
		hint "Search Distrupted";
		player playAction "medicStop";
	},



	[],
	15,
	0,
	true,
	false
	] remoteExec ["BIS_fnc_holdActionAdd", [0,-2] select isDedicated, true];
};

if (alive gang_leader) then {
	deleteVehicle gang_leader_dead_trg;
	["tskMain2_1_tsk4","SUCCEEDED"] call BIS_fnc_taskSetState;

	[player,["tskMain3_tsk4", "tsk4"],["According to the intel, there is a weapon storage near Oreokastro, your task is to confirm and secure that weapon storage. There is a police squad waiting for your call nearby the target location if you need some assistance.","Confirm And Secure"],[obj_ammo_cache],"ASSIGNED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;

	{_x hideObject false;
	_x enableSimulation true}
	forEach units bandit1;

	{_x hideObject false;
	_x enableSimulation true}
	forEach units bandit2;

	{_x hideObject false;
	_x enableSimulation true}
	forEach units policesquad_1;

	offroad1 hideObject false;
	offroad1 enableSimulation true;
	offroad2 hideObject false;
	offroad2 enableSimulation true;
	offroad3 hideObject false;
	offroad3 enableSimulation true;
	offroad1G hideObject false;
	offroad1G enableSimulation true;
	"marker_gang_hideout" setMarkerAlpha 1;
	police_radio = [] execVM "radio_police_trigger.sqf";
};
