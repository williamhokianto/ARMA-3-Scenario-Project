loop_mw3_main_music = [] spawn
{
	while {true} do
	{
		waitUntil {[main_music_trg_1, player] call BIS_fnc_inTrigger || [main_music_trg_2, player] call BIS_fnc_inTrigger || [main_music_trg_3, player] call BIS_fnc_inTrigger || [main_music_trg_4, player] call BIS_fnc_inTrigger};
		music1 = setMusicEventHandler ["MusicStop", {playMusic "mw3trackmain_full";}];
		sleep 5;
	};
};