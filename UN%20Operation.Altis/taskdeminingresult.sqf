deleteVehicle m_area_trg;
terminate loop_check_player_UAV;
terminate loop_player_d_drones;
terminate loop_player_d_drones2;
terminate minefieldclearing;
sleep 20;

d_drone1 allowDamage false;
d_drone2 allowDamage false;
d_drone3 allowDamage false;

tskMain1_tsk2_State = ["tskMain1_tsk2"] call BIS_fnc_taskState;
tskMain2_tsk2_State = ["tskMain2_tsk2"] call BIS_fnc_taskState;
tskOpt1_tsk2_State = ["tskOpt1_tsk2"] call BIS_fnc_taskState;

if (tskMain1_tsk2_State != "SUCCEEDED" && tskMain1_tsk2_State != "FAILED") then {
	["tskMain1_tsk2","CANCELED"] call BIS_fnc_taskSetState;
};

if (tskOpt1_tsk2_State != "FAILED") then {
	["tskOpt1_tsk2","SUCCEEDED"] call BIS_fnc_taskSetState;
};

if (tskMain2_tsk2_State == "SUCCEEDED") then {
	["tsk2","SUCCEEDED"] call BIS_fnc_taskSetState;
};

if (tskMain2_tsk2_State == "FAILED") then {
	["tsk2","FAILED"] call BIS_fnc_taskSetState;
};

sleep 5;

player connectTerminalToUAV objNull;
player disableUAVConnectability [d_drone1,true];
player disableUAVConnectability [d_drone2,true];
player disableUAVConnectability [d_drone3,true];

sleep 20;

tskMain1_tsk2_State = ["tskMain1_tsk2"] call BIS_fnc_taskState;
tskMain2_tsk2_State = ["tskMain2_tsk2"] call BIS_fnc_taskState;
tskOpt1_tsk2_State = ["tskOpt1_tsk2"] call BIS_fnc_taskState;

if (tskMain1_tsk2_State == "SUCCEEDED") then {
	score_demining = score_demining + 2;
};

sleep 7;

if (tskMain1_tsk2_State == "FAILED") then {
	score_demining = score_demining - 2;
};

sleep 7;

if (tskMain2_tsk2_State == "SUCCEEDED") then {
	score_demining = score_demining + 6;
};

sleep 7;

if (tskMain2_tsk2_State == "FAILED") then {
	score_demining = score_demining - 6;
};

sleep 7;

if (tskOpt1_tsk2_State == "SUCCEEDED") then {
	score_demining = score_demining + 2;
};

sleep 7;

if (tskOpt1_tsk2_State == "FAILED") then {
	score_demining = score_demining - 2;
};
