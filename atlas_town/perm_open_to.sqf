params ["_self","_side"];

if (!isserver) exitwith {};

_sidesref = _self getVariable "atlas_townp_open_to";
_sidesref pushBackUnique _side;
_self setvariable ["atlas_townp_open_to",_sidesref,true];  // need this line only for the broadcast

private _opensides = _sidesref + [];
_opensides pushBackUnique (_self getVariable "atlas_townp_owner");
{
	[_x,_opensides] call (_x getVariable "atlas_obj_open_to");
} foreach (_self getVariable "atlas_townp_objectives");
