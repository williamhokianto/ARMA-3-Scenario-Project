/* 
 * This file contains parameters to config and function call to start an instance of
 * traffic in the mission. The file is edited by the mission developer.
 *
 * See file Engima\Traffic\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Traffic.
 */
 
private ["_parameters"];

// Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Truck_02_covered_F", "C_Heli_light_01_blue_F"]],
	["VEHICLES_COUNT", 8],
	["MAX_GROUPS_COUNT", 6],
	["MIN_SPAWN_DISTANCE", 300],
	["MAX_SPAWN_DISTANCE", 800],
	["MIN_SKILL", 1],
	["MAX_SKILL", 1],
	["AREA_MARKER", "marker_traffic_1"],
	["ON_UNIT_CREATED", {(_this select 0) triggerDynamicSimulation false; (_this select 0) setVehicleLock "LOCKED";}],
	["DEBUG", false]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;

private ["_parameters"];

// Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Truck_02_covered_F", "C_Heli_light_01_blue_F"]],
	["VEHICLES_COUNT", 6],
	["MAX_GROUPS_COUNT", 4],
	["MIN_SPAWN_DISTANCE", 300],
	["MAX_SPAWN_DISTANCE", 800],
	["MIN_SKILL", 1],
	["MAX_SKILL", 1],
	["AREA_MARKER", "marker_traffic_2"],
	["ON_UNIT_CREATED", {(_this select 0) triggerDynamicSimulation false; (_this select 0) setVehicleLock "LOCKED";}],
	["DEBUG", false]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
