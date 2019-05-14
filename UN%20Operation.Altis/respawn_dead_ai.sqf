addMissionEventHandler ["EntityKilled",{
	_killed = _this select 0;
	_killer = _this select 1;
	_instigator = _this select 2;

		if (_killed == un_grenadier) then {
		_killed spawn {
			removeAllActions un_grenadier;
			"marker_grenadier" setMarkerPos getPos un_grenadier;
			"marker_grenadier" setMarkerText "Grenadier (KIA)";
			"marker_grenadier" setMarkerColor "ColorRed";
			sleep ai_respawn_time;
			deleteVehicle un_grenadier;
			sleep 3;
			un_grenadier = un_idle_group createUnit [un_grenadier_type, un_grenadier_init_pos,[],0,"FORM"];
			un_grenadier setUnitLoadout un_grenadier_loadout;
			un_grenadier disableAI "MOVE";
			un_grenadier allowDamage false;
			un_grenadier enableStamina false;
			un_grenadier call fncRemoveAction;
			grenadier_action_recruit = un_grenadier addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\gl_ca.paa' />", "un_grenadier_recruit.sqf",[],1.5,true,true,"","",3];
		};
	};

	if (_killed == un_autorifleman) then {
		_killed spawn {
			removeAllActions un_autorifleman;
			"marker_autorifleman" setMarkerPos getPos un_autorifleman;
			"marker_autorifleman" setMarkerText "Autorifleman (KIA)";
			"marker_autorifleman" setMarkerColor "ColorRed";
			sleep ai_respawn_time;
			deleteVehicle un_autorifleman;
			sleep 3;
			un_autorifleman = un_idle_group createUnit [un_autorifleman_type, un_autorifleman_init_pos,[],0,"FORM"];
			un_autorifleman setUnitLoadout un_autorifleman_loadout;
			un_autorifleman disableAI "MOVE";
			un_autorifleman allowDamage false;
			un_autorifleman enableStamina false;
			un_autorifleman call fncRemoveAction;
			autorifleman_action_recruit = un_autorifleman addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\mg_ca.paa' />", "un_autorifleman_recruit.sqf",[],1.5,true,true,"","",3];
		};
	};

	if (_killed == un_antitank) then {
		_killed spawn {
			removeAllActions un_antitank;
			"marker_antitank" setMarkerPos getPos un_antitank;
			"marker_antitank" setMarkerText "Anti Tank (KIA)";
			"marker_antitank" setMarkerColor "ColorRed";
			sleep ai_respawn_time;
			deleteVehicle un_antitank;
			sleep 3;
			un_antitank = un_idle_group createUnit [un_antitank_type, un_antitank_init_pos,[],0,"FORM"];
			un_antitank setUnitLoadout un_antitank_loadout;
			un_antitank disableAI "MOVE";
			un_antitank allowDamage false;
			un_antitank enableStamina false;
			un_antitank call fncRemoveAction;
			antitank_action_recruit = un_antitank addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\at_ca.paa' />", "un_antitank_recruit.sqf",[],1.5,true,true,"","",3];
		};
	};

	if (side _killed == CIVILIAN && faction _killed == "CIV_F" && _killed isKindOf "CAManBase" && _killer == player) then {
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_direct = civilian_kill_direct + 1;
		player addRating 1000; 
	};

	if (side _killed == CIVILIAN && faction _killed == "CIV_IDAP_F" && _killed isKindOf "CAManBase" && _killer == player) then {
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_direct = civilian_kill_direct + 1;
		player addRating 1000; 
	};




	if (side _killed == CIVILIAN && faction _killed == "CIV_F" && _killed isKindOf "CAManBase" && _killer == vls) then {
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		["tsk7","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_indirect = civilian_kill_indirect + 1;
	};

	if (side _killed == CIVILIAN && faction _killed == "CIV_IDAP_F" && _killed isKindOf "CAManBase" && _killer == vls) then {
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		["tsk7","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_indirect = civilian_kill_indirect + 1;
	};





	if (side _killed == CIVILIAN && faction _killed == "CIV_F" && _killed isKindOf "CAManBase" && _killer == uav_sentinel) then {
		["tsk5","FAILED"] call BIS_fnc_taskSetState;
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_indirect = civilian_kill_indirect + 1;
	};

	if (side _killed == CIVILIAN && faction _killed == "CIV_IDAP_F" && _killed isKindOf "CAManBase" && _killer == uav_sentinel) then {
		["tsk5","FAILED"] call BIS_fnc_taskSetState;
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_indirect = civilian_kill_indirect + 1;
	};




	if (side _killed == CIVILIAN && faction _killed == "CIV_F" && _killed isKindOf "CAManBase" && _killer == hammer) then {
		["tsk5","FAILED"] call BIS_fnc_taskSetState;
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_indirect = civilian_kill_indirect + 1;
	};

	if (side _killed == CIVILIAN && faction _killed == "CIV_IDAP_F" && _killed isKindOf "CAManBase" && _killer == hammer) then {
		["tsk5","FAILED"] call BIS_fnc_taskSetState;
		["tsk6","FAILED"] call BIS_fnc_taskSetState;
		civilian_kill_indirect = civilian_kill_indirect + 1;
	};
}];