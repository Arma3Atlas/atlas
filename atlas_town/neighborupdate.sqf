params ["_self","_neighbor"];

// Todo: check neighbors, if any have a different owner
// [_self, x] call ...enable

_neighbors = _self getVariable "atlas_town_neighbors";

assert(count _neighbors > 0); // what neighbor called us?

// Todo: Need a "forced enable" state to keep the initial objective enabled

private _myside = [_self] call (_self getvariable "atlas_townf_getowner");

private _count = { 
	_myside == [_x] call (_x getvariable "atlas_town_owner");
 } count _neighbors;

if (_neighbors == 0 && _self getvariable "atlas_town_active") then {
	[_self,true] call (_self getvariable "atlas_townf_enable");
} else 
if (_neighbors > 0 && !(_self getvariable "atlas_town_active")) then {
	[_self,false] call (_self getvariable "atlas_townf_enable");
};
[_self] call (_self getvariable "atlas_townf_draw");


