//debug
if (debug_ai_OFF) exitWith {};

params ["_self"];

format ["atlas_ai_town_enable on %1",_self] call atlas_debugout;

if (_self getvariable ["atlas_aip_once",false]) exitwith {};
_self setvariable ["atlas_aip_once",true];

format ["atlas_ai_town_enable first on town %1",_self];

_groups = [];
_groupsVeh = [];
_self setvariable ["atlas_aip_groups",_groups];
_self setvariable ["atlas_aip_groups",_groupsVeh];
_owner = [_self] call (_self getvariable "atlas_town_getowner");

//ai spawn placement tests
_myPlaces = selectBestPlaces [position _self, 150, "meadow + hills", 1, 10];
private _i = 0;

//debug markers
if !(debug_ai_spawnZonesMarkers_OFF) then {
{
	private _markername = format ["ai_spawnZone_%1_%2",_self, _i];
	_markerstr = createmarkerlocal [_markername, _x select 0];
	_markerstr setMarkerType "mil_circle";
	_markerstr setMarkerSize [0.5,0.5];
	_markerstr setMarkerAlpha 0.5;
	_markerstr setMarkerText _markername;

	_i = _i + 1;

	} forEach _myPlaces;
};
//select a random spot
_pos = _myPlaces call BIS_fnc_selectRandom;

//spawn ai ground pounders
if (ai_town_ground) then {

	_myGroup = [_pos select 0, _owner, ai_town_ground_count] call BIS_fnc_spawnGroup;
	_groups pushback _myGroup;

	//random ground pounders patrol tests
	[_myGroup, position _self, 50] call BIS_fnc_taskPatrol;
};

//spawn ai ground veh
if (ai_town_ground_veh) then {

	//spawn ai veh patrol tests
	//Array - 0: created vehicle (Object), 1: all crew (Array of Objects), 2: vehicle's group (Group)
	_posVeh = _myPlaces call BIS_fnc_selectRandom;

	//temp switch for vehicles
	_vehType = "";

	switch (_owner) do {
		case west: {_vehType = "B_MRAP_03_hmg_F"};
		case east: {_vehType = "O_MRAP_03_hmg_F"};
		case resistance: {_vehType = "I_MRAP_03_hmg_F"};
		default {};
	};

	//spawn and set to patrol
	_grpVeh = [_posVeh select 0, 180, _vehType, _owner] call bis_fnc_spawnvehicle;
	_myGroupVeh = _grpVeh select 2;
	[_myGroupVeh, position _self, 150] call BIS_fnc_taskPatrol;

	//set behavior params
	_myGroupVeh setBehaviour "CARELESS";
	_myGroupVeh setCombatMode "YELLOW";

	_groupsVeh pushback _myGroupVeh;
};
