if (!isserver) exitwith {};
params ["_self","_side"];

_sidesref = _self getVariable "atlas_townp_perm_open_to";
_sidesref pushBackUnique _side;
_self setvariable ["atlas_townp_perm_open_to",_sidesref,true];  // need this line only for the broadcast

private _opensides = _sidesref + [];
// TODO: _opensides should include sides of neighbors
_opensides pushBackUnique (_self getVariable "atlas_townp_owner");
_self setvariable ["atlas_townp_open_to",_opensides,true];
{
	[_x,_opensides] call (_x getVariable "atlas_obj_open_to");
} foreach (_self getVariable "atlas_townp_objectives");
