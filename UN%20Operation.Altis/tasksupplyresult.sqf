sleep 3;
terminate loopcheckslingloadcargo1;
terminate loopcheckslingloadcargo2;

sleep 3;
terminate loop_huron1_slingload_false;
terminate loop_huron2_slingload_false;
terminate loop_huron1_slingload_true;
terminate loop_huron2_slingload_true;

terminate loop_huron2_slingload_false;
terminate loop_huron1_slingload_true;
terminate loopmarker11;
terminate loopmarker12;
terminate loopmarker13;
terminate loopmarker14;
terminate loopmarker15;
terminate loopmarker16;

//both huron got destroyed

sleep 3;
tskMain1_tsk1_State = ["tskMain1_tsk1"] call BIS_fnc_taskState;
tskMain2_tsk1_State = ["tskMain2_tsk1"] call BIS_fnc_taskState;
tskMain3_tsk1_State = ["tskMain3_tsk1"] call BIS_fnc_taskState;
tskMain4_tsk1_State = ["tskMain4_tsk1"] call BIS_fnc_taskState;
tskOpt1_tsk1_State = ["tskOpt1_tsk1"] call BIS_fnc_taskState;

if (tskMain1_tsk1_State != "SUCCEEDED" && (!alive huron1) && (!alive huron2)) then
{
	["tskMain1_tsk1","FAILED"] call BIS_fnc_taskSetState;	
};

if (tskMain3_tsk1_State != "SUCCEEDED" && (!alive huron1) && (!alive huron2)) then
{
	["tskMain3_tsk1","FAILED"] call BIS_fnc_taskSetState;	
};

if (tskMain2_tsk1_State != "SUCCEEDED" && (!alive huron1) && (!alive huron2)) then
{
	["tskMain2_tsk1","FAILED"] call BIS_fnc_taskSetState;	
};

if (tskMain4_tsk1_State != "SUCCEEDED" && (!alive huron1) && (!alive huron2)) then
{
	["tskMain4_tsk1","FAILED"] call BIS_fnc_taskSetState;	
};

sleep 3;
//at least one huron still intact

if (tskOpt1_tsk1_State != "FAILED") then
{
	["tskOpt1_tsk1","SUCCEEDED"] call BIS_fnc_taskSetState;
};

if ((tskMain2_tsk1_State == "SUCCEEDED") || (tskMain4_tsk1_State == "SUCCEEDED")) then
{
	["tsk1","SUCCEEDED"] call BIS_fnc_taskSetState;
};

if ((tskMain2_tsk1_State == "FAILED") && (tskMain4_tsk1_State == "FAILED")) then
{
	["tsk1","FAILED"] call BIS_fnc_taskSetState;
};

sleep 3;
terminate loop_taskstatecheck_supply;
terminate cargoslingload;

sleep 20;

//calculate scores

if (tskMain2_tsk1_State == "SUCCEEDED") then {
	score_supply = score_supply + 4 ;
};

sleep 5;

if (tskMain4_tsk1_State == "SUCCEEDED") then {
	score_supply = score_supply + 4 ;
};

sleep 5;

if (tskMain2_tsk1_State == "FAILED") then {
	score_supply = score_supply - 4 ;
};

sleep 5;

if (tskMain4_tsk1_State == "FAILED") then {
	score_supply = score_supply - 4 ;
};

sleep 5;

if (tskOpt1_tsk1_State == "SUCCEEDED") then {
	score_supply = score_supply + 2 ;
};

sleep 5;

if (tskOpt1_tsk1_State == "FAILED") then {
	score_supply = score_supply - 2 ;
};