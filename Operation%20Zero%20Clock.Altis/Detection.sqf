hint "Detection Script Active";
sleep 5;
hintSilent "";

loop1 = [] spawn
{
	while {true}do
	{
		waitUntil{behaviour AAF_Officer == "AWARE"};
		hintSilent "PLAYER DO NOT KNOW ABOUT OFFICER AND THE OFFICER IS SPOOKED";
		deleteVehicle knowofficertrg;
		["tskOpt2", "Failed"] call BIS_fnc_taskSetState;
		etruck1 enableSimulation true;
		sleep 1;
        etruck1 hideObject false;
        sleep 3;
        terminate loop2;
        terminate loop1;
	};
};

loop2 = [] spawn
{
	while {true}do
	{
		waitUntil{behaviour AAF_Officer == "COMBAT"};
		hintSilent "PLAYER DO NOT KNOW ABOUT OFFICER AND THE OFFICER IS SPOOKED";
		deleteVehicle knowofficertrg;
        ["tskOpt2", "Failed"] call BIS_fnc_taskSetState;
        etruck1 enableSimulation true;
        sleep 1;
        etruck1 hideObject false;
        sleep 3;
        terminate loop1;
        terminate loop2;
	};
};