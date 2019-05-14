action_id_to_remove pushBack idap_chief_action;
idap_chief call fncRemoveAction;

patient_evacuated = 0 ;
patient_dead = 0 ;
patient_completed = 0 ;

"marker_patient_1" setMarkerAlpha 1;
"marker_patient_2" setMarkerAlpha 1;
helper_hospital_roof hideObject false;
helper_hospital_lot hideObject false;

["tskMain1_tsk3","SUCCEEDED"] call BIS_fnc_taskSetState;

[player,["tskMain2_tsk3", "tsk3"],["Transport the patient into Altis national hospital in Kavala, make sure both patient got there safely, if you're using ground vehicle go to the parking lot in front of the hospital enterance, if you're using air vehicle go to the helipad on the hospital roof.","Transport Patient"],[3756.489,12995.22,21.101],"ASSIGNED",1,true,"HEAL",true] call BIS_fnc_taskCreate;

[patient1, patient2] joinSilent player;

patient1 setCaptive true;
patient2 setCaptive true;

patient1 enableAI "MOVE";
patient2 enableAI "MOVE";

looppatientroof1 = [] spawn
{
	while {true} do
	{
		waitUntil {[hospital_roof_trg, patient1] call BIS_fnc_inTrigger || [hospital_roof_trg, patient2] call BIS_fnc_inTrigger};
		if ([hospital_roof_trg, patient1] call BIS_fnc_inTrigger) then {
			doGetOut patient1;
			patient1 setPos (getPos obj_hospital_roof_move); 
		};
		if ([hospital_roof_trg, patient2] call BIS_fnc_inTrigger) then {
			doGetOut patient2;
			patient2 setPos (getPos obj_hospital_roof_move_2); 
		};
	};
};

looppatientroof2 = [] spawn
{
	while {true} do
	{
		waitUntil {[hospital_roof_trg_2, patient1] call BIS_fnc_inTrigger || [hospital_roof_trg_2, patient2] call BIS_fnc_inTrigger};
		if ([hospital_roof_trg_2, patient1] call BIS_fnc_inTrigger) then {
			[patient1] joinSilent civ_group_patient;
			patient1 allowDamage false;
			sleep 5;
			patient1 disableAI "MOVE";
		};
		if ([hospital_roof_trg_2, patient2] call BIS_fnc_inTrigger) then {
			[patient2] joinSilent civ_group_patient;
			patient2 allowDamage false;
			sleep 5;
			patient2 disableAI "MOVE";
		};
		sleep 3;
	};
};


looppatientlot1 = [] spawn
{
	while {true} do
	{
		waitUntil {[hospital_lot_trg, patient1] call BIS_fnc_inTrigger || [hospital_lot_trg, patient2] call BIS_fnc_inTrigger};
		if ([hospital_lot_trg, patient1] call BIS_fnc_inTrigger) then {
			doGetOut patient1;
			patient1 doMove (position obj_hospital_lot_move); 
		};
		if ([hospital_lot_trg, patient2] call BIS_fnc_inTrigger) then {
			doGetOut patient2;
			patient2 doMove (position obj_hospital_lot_move_2); 
		};
		sleep 5;
	};
};

looppatientlot2 = [] spawn
{
	while {true} do
	{
		waitUntil {[hospital_lot_trg_2, patient1] call BIS_fnc_inTrigger || [hospital_lot_trg_2, patient2] call BIS_fnc_inTrigger};
		if ([hospital_lot_trg_2, patient1] call BIS_fnc_inTrigger) then {
			[patient1] joinSilent civ_group_patient;
			patient1 allowDamage false;
			sleep 5;
			patient1 disableAI "MOVE";
		};
		if ([hospital_lot_trg_2, patient2] call BIS_fnc_inTrigger) then {
			[patient2] joinSilent civ_group_patient;
			patient2 allowDamage false;
			sleep 5;
			patient2 disableAI "MOVE";
		};
		sleep 5;
	};
};

