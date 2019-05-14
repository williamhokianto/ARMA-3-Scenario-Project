action_id_to_remove pushBack police_cmdr_action;
police_commander call fncRemoveAction;

police_commander glanceAt player;

["tskMain1_tsk4","SUCCEEDED"] call BIS_fnc_taskSetState;

[player,["tskMain2_1_tsk4", "tsk4"],["We got information for the house of a criminal gang leader. Capture and question him for intel. Police got report that 8 personel is guarding that house. So watch your fire when you engaging them, make sure the leader is not killed.","Capture"],[gang_leader],"ASSIGNED",1,true,"TARGET",true] call BIS_fnc_taskCreate;

"gang_leader_house_marker" setMarkerAlpha 1;

{_x hideObject false;
_x enableSimulation true}
forEach units bandit_o_guard1;

{_x hideObject false;
_x enableSimulation true}
forEach units bandit_o_guard2;

gang_leader hideObject false;
gang_leader enableSimulation true;

offroad4 hideObject false;
offroad4 enableSimulation true;

offroad5 hideObject false;
offroad5 enableSimulation true;

offroad6 hideObject false;
offroad6 enableSimulation true;

gang_leader_alive_action = gang_leader addAction ["<t size='2' color='#ff0000'>Talk</t> <img size='2' color='#ff0000' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa' />", "gang_leader_talk.sqf",[],1.5,true,true,"","alive _target",2];