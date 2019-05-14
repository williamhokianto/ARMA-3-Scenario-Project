loop_radio_police_available = [] spawn
{
	while {true}do
	{
		waitUntil{[radio_zone_trg, player] call BIS_fnc_inTrigger};
		police_squad_trg setTriggerActivation ["ALPHA", "PRESENT", false];
	};
};

loop_radio_police_not_available = [] spawn
{
	while {true}do
	{
		waitUntil{!([radio_zone_trg, player] call BIS_fnc_inTrigger)};
		police_squad_trg setTriggerActivation ["NONE", "PRESENT", false];
	};
};