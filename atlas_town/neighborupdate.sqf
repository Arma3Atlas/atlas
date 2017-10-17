params ["_self","_neighbor"];

// Todo: check neighbors, if any have a different owner
// [_self, x] call ...enable

_neighbors = _self getVariable "atlas_town_neighbors";

assert(count _neighbors > 0); // sooo... what neighbor called us?

// Todo: Need a "forced enable" state to keep the initial objective enabled

private _myside = _self getVariable "atlas_town_owner";

private _count = { 
	_myside != _x getvariable "atlas_town_owner";
 } count _neighbors;

// No longer at the front
if (_count == 0 && _self getvariable "atlas_town_active") then {
	[_self,false] call (_self getvariable "atlas_townf_enable");
};
// Now at the front
if (_count > 0 && !(_self getvariable "atlas_town_active")) then {
	[_self,true] call (_self getvariable "atlas_townf_enable");
};
[_self] call (_self getvariable "atlas_townf_draw");

systemchat format ["town(%1) neighborupdate(%2), count(%3)",_self,_neighbor,_count];
