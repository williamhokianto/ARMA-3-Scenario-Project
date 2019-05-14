//hint "gear check initial script active";
sleep 25;
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



loopCheckGear1 = [] spawn
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

loopHeadGearTrue = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{playerHeadGear == "H_PASGT_basic_white_F"};
		["tskOpt2_Opt1", "Succeeded"] call BIS_fnc_taskSetState;
		sleep 7;
	};
};

loopHeadGearFalse = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{playerHeadGear != "H_PASGT_basic_white_F"};
		["tskOpt2_Opt1", "Created"] call BIS_fnc_taskSetState;
		sleep 7;
	};
};

loopVestTrue = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{playerVest == "V_Plain_crystal_F";};
		["tskOpt1_Opt1", "Succeeded"] call BIS_fnc_taskSetState;
		sleep 7;
	};
};

loopVestFalse = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{playerVest != "V_Plain_crystal_F";};
		["tskOpt1_Opt1", "Created"] call BIS_fnc_taskSetState;
		sleep 7;
	};
};

loopMedikitTrue = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{numberOfMedikit >= 1};
		["tskOpt3_Opt1", "Succeeded"] call BIS_fnc_taskSetState;
		sleep 7;
	};
};

loopMedikitFalse = [] spawn
{
	while {true}do
	{	
		sleep 5;
		waitUntil{numberOfMedikit < 1};
		["tskOpt3_Opt1", "Created"] call BIS_fnc_taskSetState;
		sleep 7;
	};
};

loopGearDisciplineTrue = [] spawn
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

loopGearDisciplineFalse = [] spawn
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
		["tskOpt2", "Created"] call BIS_fnc_taskSetState;
		player setCaptive true;
		sleep 7;
	};
};

loopWrongMagTrue = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerCurrentMag != "" && [playerCurrentMag, restrictedMagStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedMag", 1];
	};
};

loopWrongMagFalse = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerCurrentMag == "" || !([playerCurrentMag, restrictedMagStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedMag", 0];
	};
};

loopWrongPrimaryWeaponTrue = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerPrimaryWeapon != "" && [playerPrimaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedPrimaryWeapon", 1];
	};
};

loopWrongPrimaryWeaponFalse = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerPrimaryWeapon == "" || !([playerPrimaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedPrimaryWeapon", 0];
	};
};

loopWrongSecondaryWeaponTrue = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerSecondaryWeapon != "" && [playerSecondaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedSecondaryWeapon", 1];
	};
};

loopWrongSecondaryWeaponFalse = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerSecondaryWeapon == "" || !([playerSecondaryWeapon, restrictedWeaponsStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedSecondaryWeapon", 0];
	};
};

loopWrongHandgunTrue = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerHandgun != "" && [playerHandgun, restrictedWeaponsStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerUseRestrictedHandgun", 1];
	};
};

loopWrongHandgunFalse = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerHandgun == "" || !([playerHandgun, restrictedWeaponsStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerUseRestrictedHandgun", 0];
	};
};


loopPlayerVehicleTrue = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{!(isNull objectParent player) && playerVehicle != "B_Medic_F" && playerVehicle != "B_Truck_01_medical_F"};
		["tskOpt3", "Failed"] call BIS_fnc_taskSetState;
		player setCaptive false;
	};
};

loopPlayerVehicleFalse = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{!(isNull objectParent player) && playerVehicle != "B_Medic_F" && playerVehicle == "B_Truck_01_medical_F"};
		["tskOpt3", "Created"] call BIS_fnc_taskSetState;
		player setCaptive true;
	};
};

loopPlayerOnFoot = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{isNull objectParent player && playerVehicle == "B_Medic_F"};
		["tskOpt3", "Created"] call BIS_fnc_taskSetState;
	};
};


loopWrongBackpackTrue = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerBackpack != "" && [playerBackpack, restrictedBackpackStr] call BIS_fnc_inString};
		missionNamespace setVariable ["playerWearRestrictedBackpack", 1];
	};
};

loopWrongBackpackFalse = [] spawn
{
	while {true}do
	{
		sleep 6;
		waitUntil{playerBackpack != "" && !([playerBackpack, restrictedBackpackStr] call BIS_fnc_inString)};
		missionNamespace setVariable ["playerWearRestrictedBackpack", 0];
	};
};

loopWrongBinocularTrue = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{playerBinocular != "Binocular" && playerBinocular != ""};
		missionNamespace setVariable ["playerWearRestrictedBinocular", 1];
	};
};

loopWrongBinocularFalse = [] spawn
{
	while {true}do
	{	
		sleep 6;
		waitUntil{waitUntil{playerBinocular == "Binocular" || playerBinocular == ""};
		missionNamespace setVariable ["playerWearRestrictedBinocular", 0];
	};
};









