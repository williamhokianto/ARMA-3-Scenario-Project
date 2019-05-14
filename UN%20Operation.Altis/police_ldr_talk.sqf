action_id_to_remove pushBack police_ldr_action;
police_team_leader call fncRemoveAction;

searchrescueop_begin = 1;
{_x enableAI "PATH";
_x enableAI "MOVE"} forEach units policesquad1;
sleep 3;
deleteWaypoint [policesquad1, 0];

["tskMain1_tsk5","SUCCEEDED"] call BIS_fnc_taskSetState;

[player,["tskMain2_tsk5", "tsk5"],["Find the convoy, their last known location is approximately 1.5km east of Frini.","Find the Convoy"],[16129.244,21342.334,2],"ASSIGNED",1,true,"SCOUT",true] call BIS_fnc_taskCreate;

{_x enableSimulation true;
_x hideObject false} forEach units police_squad_ambush1;

{_x enableSimulation true;
_x hideObject false} forEach units police_squad_ambush2;

police_ambush1 enableSimulation true;
police_ambush1 hideObject false;

offroad_police1 enableSimulation true;
offroad_police1 hideObject false;

offroad_police2 enableSimulation true;
offroad_police2 hideObject false;

van_idap1 enableSimulation true;
van_idap1 hideObject false;

offroad_idap1 enableSimulation true;
offroad_idap1 hideObject false;