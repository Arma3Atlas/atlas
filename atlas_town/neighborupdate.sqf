params ["_self","_neighbor"];

/*
When this gets called, a neighbor has likely switched owner.
Therefore we need to reevaluate our active/open states
*/

_neighbors = _self getVariable "atlas_townp_neighbors";

assert(count _neighbors > 0); // sooo... what neighbor called us?

private _myside = _self getVariable "atlas_townp_owner";
private _opensides = (_self getVariable "atlas_townp_open_to") + [];
_opensides pushBackUnique _myside;

private _count = { 
	_nside = _x getvariable "atlas_townp_owner";
	_opensides pushBackUnique _nside;
	_myside != _nside;
} count _neighbors;

systemchat format ["town.neighborupdate town %1 myside %2 opensides %3 count %4",_self,_myside,_opensides,_count];

// No longer at the front
if (_count == 0 && _self getvariable "atlas_townp_active") then {
	[_self,false] call (_self getvariable "atlas_town_enable");
};
// Now at the front
if (_count > 0 && !(_self getvariable "atlas_townp_active")) then {
	{ [_x,_opensides] call (_x getvariable "atlas_obj_open_to") } 
	  foreach (_self getvariable "atlas_townp_objectives");
	[_self,true] call (_self getvariable "atlas_town_enable");
};
[_self] call (_self getvariable "atlas_town_draw");

//systemchat format ["town(%1) neighborupdate(%2), count(%3)",_self,_neighbor,_count];
