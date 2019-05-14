sleep 2;

_tskMain1_3_State = ["tskMain1_2"] call BIS_fnc_taskState;
_tskMain2_3_State = ["tskMain2_3"] call BIS_fnc_taskState;
_tskOpt3_State = ["tskOpt2"] call BIS_fnc_taskState;

if ((_tskMain1_3_State == "SUCCEEDED") AND (_tskMain2_3_State == "SUCCEEDED") AND (_tskOpt3_State != "FAILED")) then {
	["tskOpt3","SUCCEEDED"] call BIS_fnc_taskSetState;
	["tsk3","SUCCEEDED"] call BIS_fnc_taskSetState;
};

if ((_tskMain1_3_State == "SUCCEEDED") AND (_tskMain2_3_State == "SUCCEEDED") AND (_tskOpt3_State == "FAILED")) then {
	["tsk3","SUCCEEDED"] call BIS_fnc_taskSetState;
};

sleep 4;

[player,["tsk4"],["Get back to deployment point as fast as possible, there is a ghosthawk ready for your team extraction, if your vehicle still intact, leave your vehicle there and get in the ghosthawk, another heli will take care of your vehicle","Fallback &amp; Extract"],[objextract],"CREATED",1,true,"RUN",true] call BIS_fnc_taskCreate;

sleep 1;

["tsk4", "ASSIGNED"] call BIS_fnc_taskSetState;

eheli1 hideObject false; 
eheli1 enableSimulation true;

emrap1 hideObject false; 
emrap1 enableSimulation true;

heli1 hideObject false; 
heli1 enableSimulation true;

heli2 hideObject false; 
heli2 enableSimulation true;

heli3 hideObject false; 
heli3 enableSimulation true;

while {alive player} do
{
  smoke_grenade = "SmokeShell" createVehicle position objextract;
  light = "Chemlight_blue" createVehicle position objextract;
  sleep 35;
};

