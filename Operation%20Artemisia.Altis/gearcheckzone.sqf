//hint "gear check initial script active";
sleep 10;
//hintSilent "";
restrictedBackpackStr = restrictedBackpack joinString " ";
restrictedMagStr = restrictedMagsArrToStr joinString " ";
restrictedWeaponsStr = restrictedWeapons joinString " ";

playerWearRestrictedBackpack = 0;
playerBackpack = backpack player;

playerWearRestrictedBinocular = 0;
playerBinocular = binocular player;

playerUseRestrictedMag = 0;
playerCurrentMag = currentMagazine player;

playerUseRestrictedPrimaryWeapon = 0;
playerPrimaryWeapon = primaryWeapon player;

playerUseRestrictedSecondaryWeapon = 0;
playerSecondaryWeapon = secondaryWeapon player;

playerUseRestrictedHandgun = 0;
playerHandgun = handgunWeapon player;


if (playerBackpack != "" && [playerBackpack, restrictedBackpackStr] call BIS_fnc_inString) then 
{
	missionNamespace setVariable ["playerWearRestrictedBackpack", 1];
};

if (playerBackpack != "" && !([playerBackpack, restrictedBackpackStr] call BIS_fnc_inString)) then 
{
	missionNamespace setVariable ["playerWearRestrictedBackpack", 0];
};



if (playerBinocular != "Binocular" && playerBinocular != "") then 
{
	missionNamespace setVariable ["playerWearRestrictedBinocular", 1];
};

if (playerBinocular == "Binocular" || playerBinocular == "") then 
{
	missionNamespace setVariable ["playerWearRestrictedBinocular", 0];
};



if (playerCurrentMag != "" && [playerCurrentMag, restrictedMagStr] call BIS_fnc_inString) then 
{
	missionNamespace setVariable ["playerUseRestrictedMag", 1];
};

if (playerCurrentMag == "" || !([playerCurrentMag, restrictedMagStr] call BIS_fnc_inString)) then 
{
	missionNamespace setVariable ["playerUseRestrictedMag", 0];
};



if (playerPrimaryWeapon != "" && [playerPrimaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString) then 
{
	missionNamespace setVariable ["playerUseRestrictedPrimaryWeapon", 1];
};

if (playerPrimaryWeapon == "" || !([playerPrimaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString)) then 
{
	missionNamespace setVariable ["playerUseRestrictedPrimaryWeapon", 0];
};



if (playerSecondaryWeapon != "" && [playerSecondaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString) then 
{
	missionNamespace setVariable ["playerUseRestrictedSecondaryWeapon", 1];
};

if (playerSecondaryWeapon == "" || !([playerSecondaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString)) then 
{
	missionNamespace setVariable ["playerUseRestrictedSecondaryWeapon", 0];
};



if (playerHandgun != "" && [playerHandgun, restrictedWeaponsStr] call BIS_fnc_inString) then 
{
	missionNamespace setVariable ["playerUseRestrictedHandgun", 1];
};

if (playerHandgun == "" || !([playerHandgun, restrictedWeaponsStr] call BIS_fnc_inString)) then 
{
	missionNamespace setVariable ["playerUseRestrictedHandgun", 0];
};


loopWrongMagTrueZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerCurrentMag != "" && [playerCurrentMag, restrictedMagStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedMag", 1];
	};
};

loopWrongMagFalseZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerCurrentMag == "" || !([playerCurrentMag, restrictedMagStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedMag", 0];
	};
};

loopWrongPrimaryWeaponTrueZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerPrimaryWeapon != "" && [playerPrimaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedPrimaryWeapon", 1];
	};
};

loopWrongPrimaryWeaponFalseZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerPrimaryWeapon == "" || !([playerPrimaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedPrimaryWeapon", 0];
	};
};


loopWrongSecondaryWeaponTrueZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerSecondaryWeapon != "" && [playerSecondaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedSecondaryWeapon", 1];
	};
};

loopWrongSecondaryWeaponFalseZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerSecondaryWeapon == "" || !([playerSecondaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedSecondaryWeapon", 0];
	};
};

loopWrongHandgunTrueZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerHandgun != "" && [playerHandgun, restrictedWeaponsStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedHandgun", 1];
	};
};

loopWrongHandgunFalseZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerHandgun == "" || !([playerHandgun, restrictedWeaponsStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedHandgun", 0];
	};
};

loopCheckGear2 = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{alive player};
		playerHeadGear = Headgear player;
		playerVest = Vest player;
		playerBackpack = backpack player;
		playerBinocular = binocular player;
		playerPrimaryWeapon = primaryWeapon player;
		playerSecondaryWeapon = secondaryWeapon player;
		playerHandgun = handgunWeapon player;
		numberOfMedikit = {"Medikit" == _x} count (items player);
		playerMagsList = magazines player;
		playerCurrentMag = currentMagazine player;
		playerItemsCount = count (items player);
		playerItemsList = items player;
		playerAssignedItemsList = assignedItems player;
		restrictedMagsCount = {_x in playerMagsList} count restrictedMags;
		restrictedGearCount = {_x in playerItemsList} count restrictedItems;
		restrictedAssignedItemCount = {_x in playerAssignedItemsList} count restrictedItems;
		playerVehicle = typeOf vehicle player;
		sleep 5;
	};
};

sleep 5;

loopGearDisciplineTrueZone = [] spawn
{
	while {true}do
	{		
		sleep 5;
		waitUntil{
			playerWearRestrictedBinocular == 1 ||
			restrictedGearCount >= 1 ||
			restrictedAssignedItemCount >= 1 || 
			restrictedMagsCount >=1 || 
			playerVest != "V_Plain_crystal_F" || 
			playerHeadGear != "H_PASGT_basic_white_F" ||
			playerWearRestrictedBackpack == 1 ||
			playerUseRestrictedMag == 1 ||
			playerUseRestrictedPrimaryWeapon == 1 ||
			playerUseRestrictedSecondaryWeapon == 1 ||
			playerUseRestrictedHandgun == 1;
			};
		["tskOpt2", "Failed"] call BIS_fnc_taskSetState;
		player setCaptive false;
		sleep 7;
	};
};

loopGearDisciplineFalseZone = [] spawn
{
	while {true}do
	{
		sleep 5;
		waitUntil{
			playerWearRestrictedBinocular == 0 &&
			restrictedGearCount < 1 && 
			restrictedAssignedItemCount < 1 &&
			restrictedMagsCount < 1 && 
			playerVest == "V_Plain_crystal_F" && 
			playerHeadGear == "H_PASGT_basic_white_F" &&
			playerWearRestrictedBackpack == 0 &&
			playerUseRestrictedMag == 0 &&
			playerUseRestrictedPrimaryWeapon == 0 &&
			playerUseRestrictedSecondaryWeapon == 0 &&
			playerUseRestrictedHandgun == 0;
			};
		player setCaptive true;
		sleep 7;
	};
};

loopPlayerVehicleTrueZone = [] spawn
{
	while {true}do
	{	
		sleep 3;
		waitUntil{!(isNull objectParent player) && playerVehicle != "B_Medic_F" && playerVehicle != "B_Truck_01_medical_F"};
		["tskOpt3", "Failed"] call BIS_fnc_taskSetState;
		player setCaptive false;
		sleep 7;
	};
};

loopPlayerVehicleFalseZone = [] spawn
{
	while {true}do
	{	
		sleep 3;
		waitUntil{!(isNull objectParent player) && playerVehicle != "B_Medic_F" && playerVehicle == "B_Truck_01_medical_F" && !([aafairbase, player] call BIS_fnc_inTrigger) && !([enemyZone1, player] call BIS_fnc_inTrigger) && !([enemyZone2, player] call BIS_fnc_inTrigger)};
		player setCaptive true;
		sleep 7;
	};
};

loopZoneDisciplineTrue = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{
			playerUseRestrictedPrimaryWeapon == 1 ||
			playerUseRestrictedSecondaryWeapon == 1 ||
			playerUseRestrictedHandgun == 1 ||
			[enemyZone1, player] call BIS_fnc_inTrigger ||
			[enemyZone2, player] call BIS_fnc_inTrigger ||
			[aafairbase, player] call BIS_fnc_inTrigger
			};
		["tskOpt4", "Failed"] call BIS_fnc_taskSetState;
		player setCaptive false;
		sleep 7;
	};
};

loopZoneDisciplineFalse = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{
			playerUseRestrictedPrimaryWeapon == 0 &&
			playerUseRestrictedSecondaryWeapon == 0 &&
			playerUseRestrictedHandgun == 0 &&
			!([enemyZone1, player] call BIS_fnc_inTrigger) &&
			!([enemyZone2, player] call BIS_fnc_inTrigger) &&
			!([aafairbase, player] call BIS_fnc_inTrigger) 
			};
		player setCaptive true;
		sleep 7;
	};
};

loopCasAttack = [] spawn
{
	while {true}do
	{	
		waitUntil{
			[aafairbase, player] call BIS_fnc_inTrigger
			};
		CAS = [getPos player, 210, "I_Plane_Fighter_03_CAS_F", 3] execVM "MIL_CAS.sqf";
		smoke_red_CAS1 = "SmokeShellRed" createVehicle position player;
		hintSilent "AAF CAS Bomb inbound";
		sleep 10;
		deleteVehicle smoke_red_CAS1;
		sleep 20;
		CAS = [getPos player, 210, "I_Plane_Fighter_03_CAS_F", 2] execVM "MIL_CAS.sqf";
		smoke_red_CAS2 = "SmokeShellRed" createVehicle position player;
		hintSilent "AAF CAS Missiles inbound";
		sleep 10;
		deleteVehicle smoke_red_CAS2;
		sleep 20;
	};
};

loopAafAirBaseSquadAttackTrue1 = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{
			[aafairbase, player] call BIS_fnc_inTrigger &&
			{alive _x} count units aafairbasesquad1 > 0
			};
		{_x hideObject false;
		_x enableSimulation true}
		forEach units aafairbasesquad1;
		{_x doMove (getPos player)} foreach units aafairbasesquad1;
		sleep 10;
	};
};

loopAafAirBaseSquadAttackTrue2 = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{
			[aafairbase, player] call BIS_fnc_inTrigger && 
			{alive _x} count units aafairbasesquad2 > 0
			};
		{_x hideObject false;
		_x enableSimulation true}
		forEach units aafairbasesquad2;
		{_x doMove (getPos player)} foreach units aafairbasesquad2;
		sleep 10;
	};
};

loopAafAirBaseSquadAttackFalse1 = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{
			!([aafairbase, player] call BIS_fnc_inTrigger) &&
			{alive _x} count units aafairbasesquad1 > 0
			};
		{_x hideObject true;
		_x enableSimulation false}
		forEach units aafairbasesquad1;
		sleep 10;
	};
};

loopAafAirBaseSquadAttackFalse2 = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{
			!([aafairbase, player] call BIS_fnc_inTrigger) &&
			{alive _x} count units aafairbasesquad2 > 0
			};
		{_x hideObject true;
		_x enableSimulation false}
		forEach units aafairbasesquad2;
		sleep 10;
	};
};

loopArtyFire1Zone = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{!([battlezonetrg, player] call BIS_fnc_inTrigger)};
		sleep 5;
		mlrs1 doArtilleryFire [getPos objArtyTarget1, "12Rnd_230mm_rockets", 12];
		mlrs2 doArtilleryFire [getPos objArtyTarget1, "12Rnd_230mm_rockets", 12];
		sleep 10;
	};
};

loopWrongBackpackTrueZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerBackpack != "" && [playerBackpack, restrictedBackpackStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerWearRestrictedBackpack", 1];
	};
};

loopWrongBackpackFalseZone = [] spawn
{
	while {true}do
	{
		sleep 7;
		waitUntil{playerBackpack != "" && !([playerBackpack, restrictedBackpackStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerWearRestrictedBackpack", 0];
	};
};

loopWrongBinocularTrueZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{playerBinocular != "Binocular" && playerBinocular != ""};
		missionNamespace setVariable ["playerWearRestrictedBinocular", 1];
	};
};

loopWrongBinocularFalseZone = [] spawn
{
	while {true}do
	{	
		sleep 7;
		waitUntil{waitUntil{playerBinocular == "Binocular" || playerBinocular == ""};
		missionNamespace setVariable ["playerWearRestrictedBinocular", 0];
	};
};

