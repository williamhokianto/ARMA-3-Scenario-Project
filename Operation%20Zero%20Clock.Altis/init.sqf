disableUserInput true;
enableRadio false;

[player1, "Day 2 Invasion, NATO Group South, 1st Recon Company, Task Force Foxhound", 500, 250, 75, 1, [], 0, true] spawn BIS_fnc_establishingShot;

score_aaf_officer = 0;
score_destroy_supply = 0;
score_recon = 0;
score_collateral = 0;
score_medical_object = 0;

score_sub_total = 0;
score_total = 0;

contractors_killed_count = 0;
medic_person_killed_count = 0;
medic_veh_destroyed = false;
medic_house_destroyed = false;



sleep 18;

enableRadio true;
selectplayer player1;
disableUserInput false;

enableEnvironment [true, true];

[player,["tsk1"],["Gather intel on enemy post, search for the terminal and upload the data from it to HQ, our analyst will scan the data to provide you with information about the target and enemy activity in the area. Be cautious though, the post will be guarded so low profile approach and complete scan of the area is recommended.","Gather Intel",""],[DataTerminal],"CREATED",1,true,"UPLOAD",true] call BIS_fnc_taskCreate;

["tsk1", "ASSIGNED"] call BIS_fnc_taskSetState; 

player setCustomAimCoef 0;

music1 = addMusicEventHandler ["MusicStop", {playMusic "AmbientTrack04_F";}];
playMusic "AmbientTrack04_F";



