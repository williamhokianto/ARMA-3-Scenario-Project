disableUserInput true;
_tskMain1_2_State = ["tskMain1_2"] call BIS_fnc_taskState;
_tskMain1_3_State = ["tskMain1_2"] call BIS_fnc_taskState;
_tskMain2_3_State = ["tskMain2_3"] call BIS_fnc_taskState;
_tskOpt2_State = ["tskOpt2"] call BIS_fnc_taskState;

sleep 2;

if (_tskMain1_2_State == "SUCCEEDED") then {
	score_aaf_officer = score_aaf_officer + 10;
};

if (_tskMain1_3_State == "SUCCEEDED") then {
	score_destroy_supply = score_destroy_supply + 5;
};

if (_tskMain2_3_State == "SUCCEEDED") then {
	score_destroy_supply = score_destroy_supply + 5;
};

if (_tskOpt2_State == "SUCCEEDED") then {
	score_recon = score_recon + 10;
};

sleep 2;

score_collateral = 10 - (contractors_killed_count * 5);
score_medical_object = 6 - (medic_person_killed_count * 3);

sleep 2;

if (!medic_veh_destroyed) then {
	score_medical_object = score_medical_object + 2;
};

sleep 2;

if (!medic_house_destroyed) then {
	score_medical_object = score_medical_object + 2;
};

sleep 2;

score_sub_total = score_aaf_officer + score_destroy_supply + score_recon + score_collateral + score_medical_object;

sleep 1;

score_total = score_sub_total * 2;

sleep 1;

hint format ["---- SCORE ---- 
\nKill Officer Score = %1 
\nDestroy Supplies Score = %2 
\nRecon Score = %3 
\nCollateral Damage Score = %4 
\nMedical Object Score = %5 
\nTotal Score = %6 x 2 = %7 
\n 
\nContractors Killed = %8
\nMedical Personel Killed = %9
\nMedical Vehicle Destroyed = %10
\nMedical House Destroyed = %11"
, 
score_aaf_officer, 
score_destroy_supply, 
score_recon, 
score_collateral, 
score_medical_object, 
score_sub_total, 
score_total, 
contractors_killed_count, 
medic_person_killed_count, 
medic_veh_destroyed, 
medic_house_destroyed];

sleep 3;

diag_log format ["
		--------------------- SCORE ---------------------
		Kill Officer Score 				= 	%1 
		Destroy Supplies Score 			= 	%2 
		Recon Score 					= 	%3 
		Collateral Damage Score 		= 	%4 
		Medical Object Score 			= 	%5 
		Total Score 					= 	%6 x 2 = %7 
 		--------------- Non-Target Result ---------------
		Contractors Killed 				= 	%8
		Medical Personel Killed 		= 	%9
		Medical Vehicle Destroyed 		= 	%10
		Medical House Destroyed 		= 	%11
		-------------------------------------------------
		"
, 
score_aaf_officer, 
score_destroy_supply, 
score_recon, 
score_collateral, 
score_medical_object, 
score_sub_total, 
score_total, 
contractors_killed_count, 
medic_person_killed_count, 
medic_veh_destroyed, 
medic_house_destroyed];



sleep 5;
["Victory", true, true, true, true] call BIS_fnc_endMission;
disableUserInput false;