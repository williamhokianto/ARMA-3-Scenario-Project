_tsk1_State = ["tsk1"] call BIS_fnc_taskState;
_tsk2_State = ["tsk2"] call BIS_fnc_taskState;
_tsk3_State = ["tsk3"] call BIS_fnc_taskState;

if ((_tsk1_State == "SUCCEEDED") AND (_tsk1_State == "SUCCEEDED") AND (_tsk1_State == "SUCCEEDED")) then {
	hint ""
};

if ((_tsk1_State != "SUCCEEDED") AND (_tsk1_State != "SUCCEEDED") AND (_tsk1_State != "SUCCEEDED")) then {
	hint "Get Back to Mission Area, Desertion is punishable by death!"
};