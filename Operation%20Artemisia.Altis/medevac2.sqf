_tsk1_State = ["tsk1"] call BIS_fnc_taskState;
_tsk2_State = ["tsk2"] call BIS_fnc_taskState;

_tskOpt1_Opt1_State = ["tskOpt1_Opt1"] call BIS_fnc_taskState;
_tskOpt2_Opt1_State = ["tskOpt2_Opt1"] call BIS_fnc_taskState;
_tskOpt3_Opt1_State = ["tskOpt3_Opt1"] call BIS_fnc_taskState;
_tskOpt2_State = ["tskOpt2"] call BIS_fnc_taskState;
_tskOpt3_State = ["tskOpt3"] call BIS_fnc_taskState;
_tskOpt4_State = ["tskOpt4"] call BIS_fnc_taskState;


if (stabilizecomplete2 < 4) then
{
	["tskMain1_2", "Canceled"] call BIS_fnc_taskSetState;
};

if ((pointscoremedevac2 >= 1) && (pointscoremedevac2 < 4)) then
{	
	["tsk2", "Succeeded"] call BIS_fnc_taskSetState;
	["tskMain2_2", "Canceled"] call BIS_fnc_taskSetState;
};

if (pointscoremedevac2 == 4) then
{	
	["tsk2", "Succeeded"] call BIS_fnc_taskSetState;
	["tskMain2_2", "Succeeded"] call BIS_fnc_taskSetState;
};

if (pointscoremedevac2 < 1) then
{
	["tsk2", "Failed"] call BIS_fnc_taskSetState;
	["tskMain2_2", "Failed"] call BIS_fnc_taskSetState;
};






if (_tskOpt2_State != "Failed") then
{
	["tskOpt2", "Succeeded"] call BIS_fnc_taskSetState;
};

if (_tskOpt3_State != "Failed") then
{
	["tskOpt3", "Succeeded"] call BIS_fnc_taskSetState;
};

if (_tskOpt4_State != "Failed") then
{
	["tskOpt4", "Succeeded"] call BIS_fnc_taskSetState;
};

_tskOpt1_Opt1_State = ["tskOpt1_Opt1"] call BIS_fnc_taskState;
_tskOpt2_Opt1_State = ["tskOpt2_Opt1"] call BIS_fnc_taskState;
_tskOpt3_Opt1_State = ["tskOpt3_Opt1"] call BIS_fnc_taskState;

sleep 1;

if (_tskOpt1_Opt1_State == "Succeeded") then
{
	score_gear_preparation = score_gear_preparation + 4;
};

sleep 1;

if (_tskOpt2_Opt1_State == "Succeeded") then
{
	score_gear_preparation = score_gear_preparation + 4;
};

sleep 1;

if (_tskOpt3_Opt1_State == "Succeeded") then
{
	score_gear_preparation = score_gear_preparation + 2;
};

_tskOpt2_State = ["tskOpt2"] call BIS_fnc_taskState;
_tskOpt3_State = ["tskOpt3"] call BIS_fnc_taskState;
_tskOpt4_State = ["tskOpt4"] call BIS_fnc_taskState;

sleep 2;

if (_tskOpt2_State == "Succeeded") then
{
	score_gear_discipline = score_gear_discipline + 10;
};

if (_tskOpt3_State == "Succeeded") then
{
	score_medical_vehicle = score_medical_vehicle + 10;
};

if (_tskOpt4_State == "Succeeded") then
{
	score_avoid_combat = score_avoid_combat + 10;
};

score_medevac = ((pointscoremedevac1 * 2.5) + (pointscoremedevac2 * 2.5)) / 2;

sleep 1;

score_sub_total = score_medevac + score_gear_preparation + score_gear_discipline + score_medical_vehicle + score_avoid_combat;

sleep 1;

score_total = score_sub_total * 2;

soldier_rescued_count = pointscoremedevac1 + pointscoremedevac2;
soldier_killed_count = (medevaccomplete1 - pointscoremedevac1) + (medevaccomplete2 - pointscoremedevac2);

sleep 1;

hint format ["---- SCORE ---- 
\nMedevac Score = %1 
\nGear Preparation Score = %2 
\nGear Discipline Score = %3 
\nMedical Vehicle Score = %4 
\nAvoiding Combat Score = %5 
\nTotal Score = %6 * 2 = %7 
\n 
\nWounded Soldier Rescued = %8
\nWounded Soldier Killed = %9"
, 
score_medevac, 
score_gear_preparation, 
score_gear_discipline, 
score_medical_vehicle, 
score_avoid_combat,  
score_sub_total,
score_total, 
soldier_rescued_count, 
soldier_killed_count];


if (_tsk1_State == "Failed" && _tsk2_State == "Failed") then
{	
	sleep 3;
	["Lose", false, true, true, true] call BIS_fnc_endMission;
};

if (_tsk1_State == "Succeeded" || _tsk2_State == "Succeeded") then
{
	sleep 3;
	["Victory", true, true, true, true] call BIS_fnc_endMission;
};

diag_log format ["
		--------------------- SCORE ---------------------
		Medevac Score 					= 	%1 
		Gear Preparation Score 			= 	%2 
		Gear Discipline Score 			= 	%3 
		Medical Vehicle Score 			= 	%4 
		Avoiding Combat Score 			= 	%5 
		Total Score 					= 	%6 x 2 = %7 
 		------------- Medevac Result Count --------------
		Wounded Soldier Rescued 		= 	%8
		Wounded Soldier Killed 			= 	%9
		-------------------------------------------------
		"
, 
score_medevac, 
score_gear_preparation, 
score_gear_discipline, 
score_medical_vehicle, 
score_avoid_combat,  
score_sub_total,
score_total, 
soldier_rescued_count, 
soldier_killed_count];