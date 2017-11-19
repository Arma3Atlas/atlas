//debug
if (debug_ai_OFF) exitWith {};

params ["_self"];

format ["atlas_bunkerai_enable on %1",_self] call atlas_debugout;

if (_self getvariable ["atlas_aip_once",false]) exitwith {};
_self setvariable ["atlas_aip_once",true];

format ["atlas_ai_town_enable first on town %1",_self];

_groups = [];
_self setvariable ["atlas_aip_groups",_groups];
_owner = _self getvariable "atlas_objp_currentowner";

//spawn ai ground pounders
if (ai_town_ground_bunker) then {

	_myGroup = [position _self, _owner, ai_town_ground_bunker_count] call BIS_fnc_spawnGroup;
	_groups pushback _myGroup;

	//spawn static weapon system tests
	_dir = getDir _self;
	
	//player setPos [getPos player select 0, getPos player select 1, (getPos player select 2) +10];
	_posBunker = [getPos _self select 0, getPos _self select 1, (getPos _self select 2) +2];
	//static weapon test
	_staticWeap = "B_HMG_01_high_F" createVehicle _posBunker;

	//make the group defend the bunker
	[_myGroup, _posBunker] call bis_fnc_taskDefend;


};

