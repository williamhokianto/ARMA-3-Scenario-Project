_tskOpt1_Opt1_State = ["tskOpt1_Opt1"] call BIS_fnc_taskState;
_tskOpt2_Opt1_State = ["tskOpt2_Opt1"] call BIS_fnc_taskState;
_tskOpt3_Opt1_State = ["tskOpt3_Opt1"] call BIS_fnc_taskState;

_tskOpt2_State = ["tskOpt2"] call BIS_fnc_taskState;

if (_tskOpt3_Opt1_State == "SUCCEEDED" || numberOfMedikit >= 1)
then {
	terminate loopMedikitFalse;
	terminate loopMedikitTrue;
	["tskOpt3_Opt1", "Succeeded"] call BIS_fnc_taskSetState;
};

if (_tskOpt3_Opt1_State != "SUCCEEDED" || numberOfMedikit < 1)
then {
	terminate loopMedikitFalse;
	terminate loopMedikitTrue;
	["tskOpt3_Opt1", "Canceled"] call BIS_fnc_taskSetState;
};

if ((_tskOpt1_Opt1_State == "SUCCEEDED") && (_tskOpt2_Opt1_State == "SUCCEEDED"))
then {
	["tskOpt1_Opt1", "Succeeded"] call BIS_fnc_taskSetState;
	["tskOpt2_Opt1", "Succeeded"] call BIS_fnc_taskSetState;
	["tskOpt1", "Succeeded"] call BIS_fnc_taskSetState;
};

if ((_tskOpt1_Opt1_State != "SUCCEEDED") && (_tskOpt2_Opt1_State != "SUCCEEDED"))
then {
	["tskOpt1_Opt1", "Failed"] call BIS_fnc_taskSetState;
	["tskOpt2_Opt1", "Failed"] call BIS_fnc_taskSetState;
	["tskOpt1", "Failed"] call BIS_fnc_taskSetState;
};

if (_tskOpt2_State == "FAILED")
then {
	["tskOpt2", "Failed"] call BIS_fnc_taskSetState;
};

["tskMain1_2", "ASSIGNED"] call BIS_fnc_taskSetState; 