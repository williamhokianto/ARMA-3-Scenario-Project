{_x hideObject false; 
_x enableSimulation true} forEach units policesquad1;

offroad_police3 hideObject false;
offroad_police3 enableSimulation true;

[player,["tsk5"],["Altis police department have lost contact with a police convoy escorting IDAP supply vehicle. Altis police commander and IDAP chief have requested UN peacekeeping forces command to assist in joint search and rescue operations.","Search and Rescue",""],objNull,"CREATED",1,true,"SCOUT",true] call BIS_fnc_taskCreate;

[player,["tskMain1_tsk5", "tsk5"],["Talk to the police team leader near Galati, coordinate with them and build a plan for the operation","Talk to Team Leader"],[police_team_leader],"ASSIGNED",1,true,"TALK",true] call BIS_fnc_taskCreate;