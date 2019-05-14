if (stabilizecomplete1 < 4) then
{
	["tskMain1_1", "Canceled"] call BIS_fnc_taskSetState;
};

if ((pointscoremedevac1 >= 1) && (pointscoremedevac1 < 4)) then
{	
	["tsk1", "Succeeded"] call BIS_fnc_taskSetState;
	["tskMain2_1", "Canceled"] call BIS_fnc_taskSetState;
};

if (pointscoremedevac1 == 4) then
{	
	["tsk1", "Succeeded"] call BIS_fnc_taskSetState;
	["tskMain2_1", "Succeeded"] call BIS_fnc_taskSetState;
};

if (pointscoremedevac1 < 1) then
{
	["tsk1", "Failed"] call BIS_fnc_taskSetState;
	["tskMain2_1", "Failed"] call BIS_fnc_taskSetState;
};

"aaf_arrow_marker1" setMarkerAlpha 0;;
"aaf_arrow_marker2" setMarkerAlpha 0;
"aaf_arrow_marker3" setMarkerAlpha 0;
"aaf_infantry_marker4" setMarkerAlpha 0;
"aaf_infantry_marker5" setMarkerAlpha 0;
"aaf_armor_marker1" setMarkerAlpha 0;
"aaf_plane_marker1" setMarkerAlpha 0;
"aaf_heli_marker1" setMarkerAlpha 0;
"nato_arrow_marker4" setMarkerAlpha 0;


"nato_inf_marker1" setMarkerAlpha 1;;
"nato_inf_marker2" setMarkerAlpha 1;
"nato_inf_marker3" setMarkerAlpha 1;
"aaf_ambush_marker1" setMarkerAlpha 1;
"nato_arrow_marker1" setMarkerAlpha 1;
"nato_arrow_marker2" setMarkerAlpha 1;
"nato_arrow_marker3" setMarkerAlpha 1;
"aaf_infantry_marker1" setMarkerAlpha 1;
"aaf_infantry_marker2" setMarkerAlpha 1;
"aaf_infantry_marker3" setMarkerAlpha 1;

[player,["tsk2"],["NATO Convoy got ambushed near Molos, they have multiple casualties and critically wounded over there, the squad leader manage to set up a medevac point nearby, go to that medevac point and evacuate the wounded soldier back to medical station.","Medevac",""],objMedevac2,"ASSIGNED",1,true,"HEAL",true] call BIS_fnc_taskCreate;

[player,["tskMain1_2", "tsk2"],["Stabilize all of the wounded soldier first before evacuating them.","Stabilize",""],objStabilize2,"CREATED",2,true,"HELP",true] call BIS_fnc_taskCreate;

[player,["tskMain2_2", "tsk2"],["Get all of the wounded soldier back to medical station.","Evac",""],objEvac,"MOVE",2,true,"DANGER",true] call BIS_fnc_taskCreate;

{_x allowDamage true;
_x setDamage 1;}
forEach units aafgroup1;

aaf_kuma1 allowDamage true;
{allowDamage true _x} forEach crew aaf_kuma1;

aaf_kuma2 allowDamage true;
{allowDamage true _x} forEach crew aaf_kuma2;

aaf_cas1 setDamage 1;
aaf_hellcat1 setDamage 1;

{deleteVehicle _x} forEach crew nato_cas1;
deleteVehicle nato_cas1;

{deleteVehicle _x} forEach crew nato_blackfoot1;
deleteVehicle nato_blackfoot1;

nato_blackfoot2 hideObject false;
nato_blackfoot2 enableSimulation true;


{_x hideObject false;
_x enableSimulation true}
forEach units gfight_nato1;

{_x hideObject false;
_x enableSimulation true}
forEach units gfight_nato2;

{_x hideObject false;
_x enableSimulation true}
forEach units gfight_nato3;

{_x hideObject false;
_x enableSimulation true}
forEach units gfight_nato4;





{_x hideObject false;
_x enableSimulation true}
forEach units gfight_aaf1;

{_x hideObject false;
_x enableSimulation true}
forEach units gfight_aaf2;

{_x hideObject false;
_x enableSimulation true}
forEach units gfight_aaf3;

{_x hideObject false;
_x enableSimulation true}
forEach units gfight_aaf4;







injured5 hideObject false;
injured5 enableSimulation true;

injured6 hideObject false;
injured6 enableSimulation true;

injured7 hideObject false;
injured7 enableSimulation true;

injured8 hideObject false;
injured8 enableSimulation true;

sleep 5;

hunter1 hideObject false;
hunter2 hideObject false;
hunter3 hideObject false;

hemtt3 hideObject false;
hemtt4 hideObject false;





