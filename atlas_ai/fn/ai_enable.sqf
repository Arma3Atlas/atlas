params ["_self"];

format ["atlas_ai_town_enable on %1",_self] call atlas_debugout;

if (_self getvariable ["atlas_aip_once",false]) exitwith {};
_self setvariable ["atlas_aip_once",true];

format ["atlas_ai_town_enable first on town %1",_self];

_groups = [];
_self setvariable ["atlas_aip_groups",_groups];

_myGroup = [position _self, resistance, 5] call BIS_fnc_spawnGroup;
_groups pushback _myGroup;


//syntax: [arguments] call BIS_fnc_spawnGroup;
//_myGroup = [position, side, character details, relative positions, list of ranks, skill range, ammo count range, randomization controls, azimuth] call BIS_fnc_spawnGroup;

//some arguments are optional, this is the bare minimum:
//_myGroup = [position, side, character details] call BIS_fnc_spawnGroup;

