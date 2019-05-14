["tskMain3_tsk4","SUCCEEDED"] call BIS_fnc_taskSetState;
gang_leader allowDamage false;
sleep 3;
["tsk4","SUCCEEDED"] call BIS_fnc_taskSetState;
terminate loop_radio_police_available;
terminate loop_radio_police_not_available;
terminate police_radio;
deleteVehicle radio_zone_trg;
hellcat1 enableSimulation true;
hellcat1 hideObject false;
{_x hideObject false;
_x enableSimulation true;
_x enableAI "MOVE";
_x enableAI "PATH"} forEach units police_qrf1;
{_x enableAI "MOVE"} forEach units policesquad_1;
vls setMagazineTurretAmmo ["magazine_Missiles_Cruise_01_x18", 2, [0]];


sleep 5;

tskMain2_1_tsk4_state = ["tskMain2_1_tsk4"] call BIS_fnc_taskState;
tskMain2_2_tsk4_state = ["tskMain2_2_tsk4"] call BIS_fnc_taskState;
tskMain3_tsk4_state = ["tskMain3_tsk4"] call BIS_fnc_taskState;
know_police_missing = know_police_missing + 1 ;

sleep 20;

if ( (tskMain2_1_tsk4_state == "SUCCEEDED") && (alive gang_leader) ) then {
	score_police = score_police + 5;
};

sleep 5;

if ( (tskMain2_1_tsk4_state == "SUCCEEDED") && (!alive gang_leader) ) then {
	score_police = score_police + 1;
};

sleep 5;

if (tskMain2_1_tsk4_state == "FAILED") then {
	score_police = score_police + 1;
};

sleep 5;

if (tskMain2_2_tsk4_state == "SUCCEEDED") then {
	score_police = score_police + 3;
};

sleep 5;

if (tskMain3_tsk4_state == "SUCCEEDED") then {
	score_police = score_police + 5;
};


//dead before task 		=	0
//taskMain2_1 success 	= 	0 + 5 = 5
//taskMain2_1 failed  	=	0 + 1 = 1
//taskMain2_2 success 	=	0 + 2 = 2

//------------ score possibility ------------
//taskMain2_1 success & tskMain3 success & gang_leader alive 	= 0 + 5 + 5 = 10
//taskMain2_1 success & tskMain3 success & gang_leader dead	 	= 0 + 5 + 1 = 6
//tskMain2_1 failed & taskMain2_2 success & tskMain3 success	= 0 + 2 + 5 = 8

