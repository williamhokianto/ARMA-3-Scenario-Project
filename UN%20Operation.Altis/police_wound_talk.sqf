removeMusicEventHandler ["MusicStop",music3];
rescued_idap = 0 ;
released_idap = 0 ;
dead_idap = 0 ;
rescue_idap_complete = 0 ;

search_idap_begin = 1 ;
searchrescueop_begin = searchrescueop_begin - 1;

action_id_to_remove pushBack police_wound_action;
police_ambush1 call fncRemoveAction;

["tskMain3_tsk5","SUCCEEDED"] call BIS_fnc_taskSetState;

[player,["tskMain4_tsk5", "tsk5"],["Search two kidnapped IDAP worker and release them from captivity. they are around Frini woodlands, west from the ambush site.","Find IDAP Worker"],[obj_rescue_idap],"ASSIGNED",1,true,"SCOUT",true] call BIS_fnc_taskCreate;

[player,["tskMain5_tsk5", "tsk5"],["Medevac helicopter is on their way to ambush site location. Transport the IDAP worker back to the ambush site once you rescue them.","Rescue IDAP Worker"],[med_heli1],"CREATED",1,true,"RUN",true] call BIS_fnc_taskCreate;

"marker_rescue_idap" setMarkerAlpha 0.5;

{_x hideObject false; 
_x enableSimulation true} forEach units bandit_idap1;

{_x hideObject false; 
_x enableSimulation true} forEach units bandit_idap2;

{_x hideObject false; 
_x enableSimulation true} forEach units bandit_idap3;

{_x hideObject false; 
_x enableSimulation true} forEach units bandit_idap4;

idapworker1 hideObject false;
idapworker1 enableSimulation true;

idapworker2 hideObject false;
idapworker2 enableSimulation true;




// police_ambush1 hideObject false;
// police_ambush1 enableSimulation true;
// {_x hideObject false; _x enableSimulation true} forEach units policesquad2;
// 
// know_police_missing = know_police_missing + 1; know_idap_missing = know_idap_missing + 1;
// med_pilot1 hideObject false;
// med_pilot1 enableSimulation true;
// med_pilot2 hideObject false;
// med_pilot2 enableSimulation true;
// med_heli1 hideObject false;
// med_heli1 enableSimulation true;
// this animateDoor ["CargoRamp_Open", 1, false];
// removeAllWeapons police_ambush1;
// police_ambush1 setDamage 0.5;
// ["tskMain2_tsk5","SUCCEEDED"] call BIS_fnc_taskSetState;
// 
// 
// 
// 
// 
// 
// 
// 
