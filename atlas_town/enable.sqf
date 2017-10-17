params ["_self","_activate"];
// todo typecheck _activate
_self setVariable ["atlas_town_active",_activate];

{
	[_x,_activate] call (_x getvariable "atlas_objf_enable");
} foreach (_self getVariable "atlas_town_objectives");

[_self,false] call (_self getvariable "atlas_townf_draw");
