player_uav = getConnectedUAV player;

loop_check_player_UAV = [] spawn
{
	while {true} do
	{
		waitUntil { sleep 3; [m_area_trg, player] call BIS_fnc_inTrigger };
		player_uav = getConnectedUAV player;
		player enableUAVConnectability [d_drone1,true];
		player enableUAVConnectability [d_drone2,true];
		player enableUAVConnectability [d_drone3,true];
		if (!(player_uav isEqualTo d_drone1) && !(player_uav isEqualTo d_drone2) && !(player_uav isEqualTo d_drone3)) then {
			["tskMain1_tsk2","ASSIGNED"] call BIS_fnc_taskSetState;
			["tskMain2_tsk2","CREATED"] call BIS_fnc_taskSetState;
			sleep 1;
		};
	sleep 1;
	};
};

loop_player_d_drones = [] spawn
{
	while {true} do
	{
		waitUntil { sleep 3; [m_area_trg, player] call BIS_fnc_inTrigger && !(player_uav isEqualTo objNull) };
		if ((player_uav isEqualTo d_drone1) || (player_uav isEqualTo d_drone2) || (player_uav isEqualTo d_drone3)) then {
			["tskMain1_tsk2","SUCCEEDED"] call BIS_fnc_taskSetState;
			["tskMain2_tsk2","ASSIGNED"] call BIS_fnc_taskSetState;
			sleep 1;
		};
	sleep 1;	
	};
};

loop_player_d_drones2 = [] spawn
{
	while {true} do
	{
		waitUntil { !([m_area_trg, player] call BIS_fnc_inTrigger) };
		if ((isUAVConnected d_drone1) || (isUAVConnected d_drone1) || (isUAVConnected d_drone1)) then {
			player connectTerminalToUAV objNull;
			player disableUAVConnectability [d_drone1,true];
			player disableUAVConnectability [d_drone2,true];
			player disableUAVConnectability [d_drone3,true];
		};
	sleep 1;	
	};
};