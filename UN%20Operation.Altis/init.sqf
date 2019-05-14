player playMove "HubSpectator_standu";
disableUserInput true;
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";
police_ambush1 disableCollisionWith police_medic1;
police_medic1 disableCollisionWith police_ambush1;
operator1 disableCollisionWith destroyer;
operator2 disableCollisionWith destroyer;
player setCustomAimCoef 0;

score_total = 0;
score_sub_total = 0;
score_added = 40;

score_supply = 0;
score_demining = 0;
score_police = 0;
score_idap_evac = 0;
score_rescue_idap = 0;
score_civilian_p = 0;
score_civilian_fs = 0;
score_civilian_total = 0;



civilian_kill_direct = 0;
civilian_kill_indirect = 0;

ai_respawn_time = 60;

know_police_missing = 0;
know_idap_missing = 0;

assets_invicibility = 1;

un_idle_group = createGroup WEST;
civ_group_patient = createGroup CIVILIAN;
civ_group_worker = createGroup CIVILIAN;

west_group_drone1 = createGroup WEST;
west_group_drone2 = createGroup WEST;
west_group_drone3 = createGroup WEST;

[d_drone1] joinSilent west_group_drone1;
[d_drone2] joinSilent west_group_drone2;
[d_drone3] joinSilent west_group_drone3;

un_grenadier_type = typeOf un_grenadier;
un_grenadier_init_pos = getPos un_grenadier;
un_grenadier_loadout = getUnitLoadout [un_grenadier, true];

un_autorifleman_type = typeOf un_autorifleman;
un_autorifleman_init_pos = getPos un_autorifleman;
un_autorifleman_loadout = getUnitLoadout [un_autorifleman, true];

un_antitank_type = typeOf un_antitank;
un_antitank_init_pos = getPos un_antitank;
un_antitank_loadout = getUnitLoadout [un_antitank, true];

vls setMagazineTurretAmmo ["magazine_Missiles_Cruise_01_x18", 2, [0]];
hammer addMagazineTurret ["magazine_ShipCannon_120mm_HE_shells_x32", [0], 4];
hammer addMagazineTurret ["magazine_ShipCannon_120mm_HE_LG_shells_x2", [0], 2];
//hammer setMagazineTurretAmmo ["magazine_ShipCannon_120mm_HE_shells_x32", 4, [0]];
//hammer setMagazineTurretAmmo ["magazine_ShipCannon_120mm_HE_LG_shells_x2", 2, [0]];
player disableUAVConnectability [d_drone1,true];
player disableUAVConnectability [d_drone2,true];
player disableUAVConnectability [d_drone3,true];


[player,["tsk1"],["After the war, Altis population is in needs for supplies to build and support several public service facilities that got lost or destroyed during the war. As part of UN peacekeeping mission, your task is to ensure that the supplies is delivered to the location safely. however, the UN only got limited resources at hands, so make sure you're not wasting any assets &amp supplies while you delivering those supplies.","Supplies Delivery",""],objNull,"CREATED",1,true,"BOX",true] call BIS_fnc_taskCreate;

[player,["tskMain1_tsk1", "tsk1"],["Get a heavy lift helicopter (CH-67 Huron) and sling load a building cargo container, you can find the container in UN supply depot near Altis international airport or UN Forward Operation Base near Ioannina","Lift Cargo (Building)",""],objNull,"CREATED",1,true,"HELI",true] call BIS_fnc_taskCreate;

[player,["tskMain2_tsk1", "tsk1"],["Deliver the building cargo container to construction site near Athira, make sure you unload the container in container bay area","Deliver Cargo (Building)",""],[obj_supplybuilding],"CREATED",1,true,"CONTAINER",true] call BIS_fnc_taskCreate;


[player,["tskMain3_tsk1", "tsk1"],["Get a heavy lift helicopter (CH-67 Huron) and sling load a medical cargo container, you can find the container in UN supply depot near Altis international airport or UN Forward Operation Base near Ioannina","Lift Cargo (Medical)",""],objNull,"CREATED",1,true,"HELI",true] call BIS_fnc_taskCreate;

[player,["tskMain4_tsk1", "tsk1"],["Deliver the medical cargo container to IDAP medical station near Sofia, make sure you unload the container in container bay area","Deliver Cargo (Medical)",""],[obj_supplymedical],"CREATED",1,true,"CONTAINER",true] call BIS_fnc_taskCreate;


[player,["tskOpt1_tsk1", "tsk1"],["UN resources in Altis are limited, make sure you're not wasting any single cargo container","Preserve Resources (Optional)",""],objNull,"CREATED",1,true,"DANGER",true] call BIS_fnc_taskCreate;


[player,["tsk2"],["During the war, several minefield sites has been built in Altis, but when the war is over this minefield sites is not gonna deactivate themselves, a lot of civilians got killed by these active minefield sites. Your task is to clear the active minefield site, IDAP worker has already detected one of the active minefield sites. Head to that site and use the demining drones to clear the mines in that location.","Demining",""],objNull,"CREATED",1,true,"MINE",true] call BIS_fnc_taskCreate;

[player,["tskMain1_tsk2", "tsk2"],["Get to the minefield site and connect your UAV terminal to one of demining drones. if you don't have a UAV terminal, go to the infantry supply area or the table near IDAP van. (Must use only NATO UAV terminal). if all of the drones destroyed this task will fail and you must complete the task by other means (e.g. using toolkit or shoot the mines).","Connect to UAV"],[obj_demining_drone],"CREATED",1,true,"INTERACT",true] call BIS_fnc_taskCreate;

[player,["tskMain2_tsk2", "tsk2"],["Destroy all mines in the site, make sure no single mines left active in that site","Destroy Mines","Clearing Minefield"],[obj_m_field],"CREATED",1,true,"DESTROY",true] call BIS_fnc_taskCreate;

[player,["tskOpt1_tsk2", "tsk2"],["The demining drones is an IDAP asset. the IDAP now is very limited on resources, so make sure you're not destroying any of these drones","Keep Drones (Optional)"],objNull,"CREATED",1,true,"DANGER",true] call BIS_fnc_taskCreate;


[player,["tsk3"],["IDAP is the humanitarian aid organization operating in Altis after the war, they're helping citizens of Altis by providing several public service in the region. UN peacekeeping forces should ensure their safety and providing help for their operations.","Help IDAP",""],[idap_chief],"CREATED",1,true,"HELP",true] call BIS_fnc_taskCreate;

[player,["tskMain1_tsk3", "tsk3"],["Talk to the IDAP chief in the IDAP medical station and see if there is anything the UN peacekeeping forces can do to help.","Talk to IDAP chief"],objNull,"CREATED",1,true,"TALK",true] call BIS_fnc_taskCreate;


[player,["tsk4"],["During the war the local police department operations is being reduced to prevent collision with military forces in the conflict. This makes an opportunity for any crime activities in the region. After the war, the police department needs to establish huge-scale operations to counter the rising crimes rate. UN peacekeeping forces is tasked to assist the police department in their operations.","Help Altis PD",""],objNull,"CREATED",1,true,"HELP",true] call BIS_fnc_taskCreate;

[player,["tskMain1_tsk4", "tsk4"],["Talk to the Altis police commander in his head quarters and see if there is anything the UN peacekeeping forces can do to assist.","Talk to Commander"],[police_commander],"CREATED",1,true,"TALK",true] call BIS_fnc_taskCreate;

[player,["tsk6"],["Avoid any civilian casualties.","Collateral Damage"],objNull,"CREATED",1,true,"DANGER",true] call BIS_fnc_taskCreate;

[player,["tsk7"],["Avoid using and directing fire support on area with high civilian activities","Fire Support ROE"],objNull,"CREATED",1,true,"DANGER",true] call BIS_fnc_taskCreate;



cargoslingload = [] execVM "cargoslingload.sqf";
minefieldclearing = [] execVM "minefieldclearing.sqf";
removingaction = [] execVM "removingaction.sqf";
loopmarker_a = [] execVM "loop_marker_a.sqf";
loopmarker_b = [] execVM "loop_marker_b.sqf";
respawn_dead_ai = [] execVM "respawn_dead_ai.sqf";

titleCut ["", "BLACK FADED", 999];
[] Spawn {

titleText ["Preparing Mission .. Please wait a moment ..","PLAIN"];
titleFadeOut 20;
sleep 15;
sleep 3;
"dynamicBlur" ppEffectEnable true;   
"dynamicBlur" ppEffectAdjust [6];   
"dynamicBlur" ppEffectCommit 0;     
"dynamicBlur" ppEffectAdjust [0.0];  
"dynamicBlur" ppEffectCommit 5;
sleep 2;
[player, "Post-War Day 3, UN Peacekeeping Forces, US 3rd Marine Regiment, 1st Peacekeeping Task Force Squad", 200, 110, 250, 1, [], 0, true] spawn BIS_fnc_establishingShot;
titleCut ["", "BLACK IN", 2];
sleep 21;
player switchMove "";
player action ["WeaponOnBack", player];
disableUserInput false;
playMusic ["mw3trackmain_full",1];
music1 = addMusicEventHandler ["MusicStop", {playMusic "mw3trackmain_full";}];
};
//tskMain1_tsk1_State = ["tskMain1_tsk1"] call BIS_fnc_taskState; 
//tskMain2_tsk1_State = ["tskMain2_tsk1"] call BIS_fnc_taskState;

//(tskMain1_tsk1_State == "FAILED") && (tskMain2_tsk1_State == "FAILED");