loopArtyFire1 = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{!([battlezonetrg, player] call BIS_fnc_inTrigger)};
		sleep 5;
		mlrs1 doArtilleryFire [getPos objArtyTarget1, "12Rnd_230mm_rockets", 12];
		mlrs2 doArtilleryFire [getPos objArtyTarget1, "12Rnd_230mm_rockets", 12];
		sleep 13;
	};
};