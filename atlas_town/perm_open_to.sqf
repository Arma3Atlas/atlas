params ["_self","_side"];

_sidesref = _self getVariable "atlas_townp_open_to";
_sidesref pushBackUnique _side;

private _opensides = _sidesref + [];
_opensides pushBackUnique (_self getVariable "atlas_townp_owner");
{
	[_x,_opensides] call (_x getVariable "atlas_obj_open_to");
} foreach (_self getVariable "atlas_townp_objectives");
