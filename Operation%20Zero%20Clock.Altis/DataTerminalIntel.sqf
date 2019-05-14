
[DataTerminal,
"Upload Intel",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
"player distance DataTerminal < 5",
"player distance DataTerminal < 5",
{[DataTerminal, 3] call BIS_fnc_DataTerminalAnimate;},


{},

{
[DataTerminal, 0] call BIS_fnc_DataTerminalAnimate;

["tsk1", "Succeeded"] call BIS_fnc_taskSetState;

"meetingmarker1" setMarkerAlpha 1;
"meetingmarker2" setMarkerAlpha 1;
"meetingmarker3" setMarkerAlpha 1;
"meetingmarker4" setMarkerAlpha 1;

"meetingcircle1" setMarkerAlpha 1;
"meetingcircle2" setMarkerAlpha 1;
"meetingcircle3" setMarkerAlpha 1;
"meetingcircle4" setMarkerAlpha 1;

[player,["tsk2"],["We got information about approximate meeting location between high ranking AAF officer and some military equipment contractors, find the AAF officer and kill him, it's a perfect opportunity for us to cripple AFF command structure. The officer will be guarded and be careful not to let the contractors get killed on any condition. Use the UAV on your vehicle to do some recon first if possible.","Assasinate AAF Officer",""],objNull,"CREATED",1,true,"KILL",true] call BIS_fnc_taskCreate;

[player,["tskOpt1", "tsk2"],["Do not let any contractors get killed, otherwise their employer will call in private military QRF for the respond.","Don't let contractors killed",""],objNull,"CREATED",3,true,"DANGER",true] call BIS_fnc_taskCreate;

[player,["tskOpt2", "tsk2"],["Some recon will be helpfull to prevent collateral damage and give you element of surprise to your advantage before you engaging target. You can get to some high ground and use your weapon scope and binoculars or you can deploy your UAV to observe the surroundings and identify targets.","Reconnaissance"],objNull,"CREATED",2,true,"SCOUT",true] call BIS_fnc_taskCreate;

[player,["tskMain1_2", "tsk2"],["Kill the AAF Officer, use precise and caution when you engage","Kill the AAF Officer"],objNull,"CREATED",1,true,"KILL",true] call BIS_fnc_taskCreate;

["tskMain1_2", "ASSIGNED"] call BIS_fnc_taskSetState; 

DetectionScript = [] execVM "Detection.sqf";

playMusic "AmbientTrack04a_F";
},

{[DataTerminal, 0] call BIS_fnc_DataTerminalAnimate;
hint "Upload is Interrupted";},



[],
10,
0,
true,
false
] remoteExec ["BIS_fnc_holdActionAdd", [0,-2] select isDedicated, true];
music2 = setMusicEventHandler ["MusicStop", {playMusic "AmbientTrack04a_F";}];
