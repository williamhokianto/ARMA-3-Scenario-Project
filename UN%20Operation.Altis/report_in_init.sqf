deleteVehicle main_music_trg_1;
removeMusicEventHandler ["MusicStop",music1];
removeMusicEventHandler ["MusicStop",music2];
removeMusicEventHandler ["MusicStop",music3];
removeMusicEventHandler ["MusicStop",music4];

playMusic "";
playMusic ["mw3_closing_f",1];

music5 = addMusicEventHandler ["MusicStop", {playMusic ["mw3_closing_f",1];}];
sleep 2;

[player,["tsk8"],["Report back to HeadQuarters officer","Report"],[un_officer],"ASSIGNED",1,true,"DOCUMENTS",true] call BIS_fnc_taskCreate;

officer_action_report = un_officer addAction ["<t size='2' color='#ffffff'>Report</t> <img size='2' color='#ffffff' image='\a3\Ui_f\data\IGUI\Cfg\simpleTasks\types\documents_ca.paa' />", "officer_action_report.sqf",[],1.5,true,true,"","",3];


