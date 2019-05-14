sleep 15;

loopCheckGearMedikit = [] spawn
{
	while {true}do
	{
		sleep 3;
		numberOfMedikit = {"Medikit" == _x} count (items player);
		sleep 3;
	};
};

loopNoMedikit1True = [] spawn
{
	while {true}do
	{
		sleep 3;
		waitUntil{numberOfMedikit == 0 && [medikitremindertrg1, player] call BIS_fnc_inTrigger};
		hintSilent "You need a medikit to stabilize the wounded soldier";
		sleep 3;
	};
};

loopNoMedikit1False = [] spawn
{
	while {true}do
	{
		sleep 3;
		waitUntil{numberOfMedikit >= 1 && [medikitremindertrg1, player] call BIS_fnc_inTrigger};
		hintSilent "";
		sleep 3;
	};
};

loopNoMedikit2True = [] spawn
{
	while {true}do
	{
		sleep 3;
		waitUntil{numberOfMedikit == 0 && [medikitremindertrg2, player] call BIS_fnc_inTrigger};
		hintSilent "You need a medikit to stabilize the wounded soldier";
		sleep 3;
	};
};

loopNoMedikit2False = [] spawn
{
	while {true}do
	{
		sleep 3;
		waitUntil{numberOfMedikit >= 1 && [medikitremindertrg2, player] call BIS_fnc_inTrigger};
		hintSilent "";
		sleep 3;
	};
};