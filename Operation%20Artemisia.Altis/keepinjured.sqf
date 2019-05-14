//hint "Keep Injured Script Active";
sleep 15;
//hintSilent "";

loop1 = [] spawn
{
	while {true}do
	{	
		sleep 2;
		waitUntil{damage injured1 < 0.3};
		injured1 setDamage 0.8;
		hint "injured1 damaged again";
		sleep 5;
	};
};

loop2 = [] spawn
{
	while {true}do
	{	
		sleep 2;
		waitUntil{damage injured2 < 0.3};
		injured2 setDamage 0.8;
		hint "injured2 damaged again";
		sleep 5;
	};
};

loop3 = [] spawn
{
	while {true}do
	{
		sleep 2;
		waitUntil{damage injured3 < 0.3};
		injured3 setDamage 0.8;
		hint "injured3 damaged again";
		sleep 5;
	};
};

loop4 = [] spawn
{
	while {true}do
	{
		sleep 2;
		waitUntil{damage injured4 < 0.3};
		injured4 setDamage 0.8;
		hint "injured4 damaged again";
		sleep 5;
	};
};

loop5 = [] spawn
{
	while {true}do
	{
		sleep 2;
		waitUntil{damage injured5 < 0.3};
		injured4 setDamage 0.8;
		hint "injured5 damaged again";
		sleep 5;
	};
};

loop6 = [] spawn
{
	while {true}do
	{
		sleep 2;
		waitUntil{damage injured6 < 0.3};
		injured4 setDamage 0.8;
		hint "injured6 damaged again";
		sleep 5;
	};
};

loop7 = [] spawn
{
	while {true}do
	{
		sleep 2;
		waitUntil{damage injured7 < 0.3};
		injured4 setDamage 0.8;
		hint "injured7 damaged again";
		sleep 5;
	};
};

loop8 = [] spawn
{
	while {true}do
	{
		sleep 2;
		waitUntil{damage injured8 < 0.3};
		injured4 setDamage 0.8;
		hint "injured8 damaged again";
		sleep 5;
	};
};