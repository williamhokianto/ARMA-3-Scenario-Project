action_id_to_remove pushBack officer_action_report;
un_officer call fncRemoveAction;

["tsk8","SUCCEEDED"] call BIS_fnc_taskSetState;

tsk6_State = ["tsk5"] call BIS_fnc_taskState;
tsk7_State = ["tsk5"] call BIS_fnc_taskState;

if (tsk6_State == "FAILED") then {
	score_civilian_p = score_civilian_p - 5;
};

if (tsk7_State == "FAILED") then {
	score_civilian_fs = score_civilian_fs - 5;
};

if (tsk6_State != "FAILED") then {
	["tsk6","SUCCEEDED"] call BIS_fnc_taskSetState;
	score_civilian_p = score_civilian_p + 5;
};

if (tsk7_State != "FAILED") then {
	["tsk7","SUCCEEDED"] call BIS_fnc_taskSetState;
	score_civilian_fs = score_civilian_fs + 5;
};

sleep 3;

score_civilian_total = score_civilian_p + score_civilian_fs;

sleep 2;

score_sub_total = score_supply + score_demining + score_police + score_idap_evac + score_rescue_idap + score_civilian_total;

sleep 2;

score_total = score_sub_total + score_added;

sleep 3;

hint format ["---- SCORE ---- 
\nSupplies Score = %1 
\nDemining Score = %2 
\nPolice Score = %3 
\nIDAP Medic Score = %4 
\nIDAP Rescue Score = %5 
\nCivilian Score = %6 
\nTotal Score = %7 + %8 = %9 
\n 
\nCivilian Killed (Directly) = %10
\nCivilian Killed (Indirectly) = %11"
, 
score_supply, 
score_demining, 
score_police, 
score_idap_evac, 
score_rescue_idap, 
score_civilian_total, 
score_sub_total, 
score_added, 
score_total, 
civilian_kill_direct, 
civilian_kill_indirect];

diag_log format ["
		--------------------- SCORE ---------------------
		Supplies Score 					= 	%1 
		Demining Score 					= 	%2 
		Police Score 					= 	%3 
		IDAP Medic Score 				= 	%4 
		IDAP Rescue Score 				= 	%5 
		Civilian Score 					= 	%6 
		Total Score 					= 	%7 + %8 = %9 
 		-------------- Civilian Kill Count --------------
		Civilian Killed (Directly) 		= 	%10
		Civilian Killed (Indirectly) 	= 	%11
		-------------------------------------------------
		"
, 
score_supply, 
score_demining, 
score_police, 
score_idap_evac, 
score_rescue_idap, 
score_civilian_total, 
score_sub_total, 
score_added, 
score_total, 
civilian_kill_direct, 
civilian_kill_indirect];
sleep 5;

["Victory", true, 1, true, true] call BIS_fnc_endMission;


