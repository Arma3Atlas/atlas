//debug
if (debug_ai_OFF) exitWith {};

params ["_self"];

format ["atlas_ai_town_enable on %1",_self] call atlas_debugout;

if (_self getvariable ["atlas_aip_once",false]) exitwith {};
_self setvariable ["atlas_aip_once",true];

format ["atlas_ai_town_enable first on town %1",_self];

_groups = [];
_self setvariable ["atlas_aip_groups",_groups];

//ai spawn placement tests
_myPlaces = selectBestPlaces [position _self, 150, "meadow + hills", 1, 10];
private _i = 0;

//debug markers
if !(debug_ai_spawnZonesMarkers_OFF) then {
{
	private _markername = format ["ai_spawnZone_%1_%2",_self, _i];
	_markerstr = createmarkerlocal [_markername, _x select 0];
	//_markerstr setMarkerShape "ELLIPSE";
	//_markerstr setMarkerSize [400,400];
	_markerstr setMarkerType "mil_circle";
	_markerstr setMarkerSize [0.5,0.5];
	_markerstr setMarkerAlpha 0.5;
	_markerstr setMarkerText _markername;

	_i = _i + 1;

	} forEach _myPlaces;
};

_pos = _myPlaces call BIS_fnc_selectRandom;

_myGroup = [_pos select 0, resistance, 5] call BIS_fnc_spawnGroup;
_groups pushback _myGroup;


//syntax: [arguments] call BIS_fnc_spawnGroup;
//_myGroup = [position, side, character details, relative positions, list of ranks, skill range, ammo count range, randomization controls, azimuth] call BIS_fnc_spawnGroup;

//some arguments are optional, this is the bare minimum:
//_myGroup = [position, side, character details] call BIS_fnc_spawnGroup;

//random patrol tests
//[group this, getPos this, number] call BIS_fnc_taskPatrol;
[_myGroup, position _self, 50] call BIS_fnc_taskPatrol;

