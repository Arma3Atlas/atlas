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

_myGroup = [position _self, _owner, 2] call BIS_fnc_spawnGroup;
_groups pushback _myGroup;

//make the group defend the bunker
[_myGroup, position _self] call bis_fnc_taskDefend;


