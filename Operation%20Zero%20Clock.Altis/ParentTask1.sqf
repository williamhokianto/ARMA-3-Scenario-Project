_tskMain1_2_State = ["tskMain1_2"] call BIS_fnc_taskState;
_tskOpt1_State = ["tskOpt1"] call BIS_fnc_taskState;
_tskOpt2_State = ["tskOpt2"] call BIS_fnc_taskState;

if ((_tskOpt2_State != "SUCCEEDED") AND (_tskOpt2_State !="FAILED")) then {
	["tskOpt2","CANCELED"] call BIS_fnc_taskSetState;
};

sleep 1;

if ((_tskMain1_2_State == "SUCCEEDED") AND (_tskOpt1_State !="FAILED")) then {
	["tskOpt1","SUCCEEDED"] call BIS_fnc_taskSetState;
	["tsk2","SUCCEEDED"] call BIS_fnc_taskSetState;
};

sleep 1;

"supplymarker" setMarkerAlpha 1;

[player,["tsk3"],["We've got information about position of one AAF supply depot, your task is to destroy all military equipment stash and vehicle stored in that area to distrupt enemy supply chain on the frontline, but to comply with rules of humanitarian law, there is medical equipment and personel in that area that will be not harmed in any way. So make your approach as careful as possible not to destroy medical things in that area. Once you destroy the supply there will be AAF QRF dispatched to supply depot for sure, so get out of there soon as you complete the mission.","Destroy Supply",""],[objsupplypos],"CREATED",1,true,"DESTROY",true] call BIS_fnc_taskCreate;

[player,["tskOpt3", "tsk3"],["Do not destroy or kill medical supply and personel in the area, otherwise they will call in more heavy QRF to respond.","Preserve Medical"],objNull,"CREATED",4,true,"DANGER",true] call BIS_fnc_taskCreate;

[player,["tskMain1_3", "tsk3"],["Destroy all of enemy supply cache.","Destroy Cache"],objNull,"CREATED",2,true,"BOX",true] call BIS_fnc_taskCreate;

[player,["tskMain2_3", "tsk3"],["Destroy all of enemy supply vehicle.","Destroy Truck"],objNull,"CREATED",3,true,"TRUCK",true] call BIS_fnc_taskCreate;

["tskMain1_3", "ASSIGNED"] call BIS_fnc_taskSetState;

sleep 3;


