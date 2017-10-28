if (!isserver) exitwith {};
params ["_self","_activate"];
assert (typename _activate == "BOOL");

_self setVariable ["atlas_townp_active",_activate,true];

{
	[_x,_activate] call (_x getvariable "atlas_obj_enable");
} foreach (_self getVariable "atlas_townp_objectives");

[_self,false] call (_self getvariable "atlas_town_draw");
