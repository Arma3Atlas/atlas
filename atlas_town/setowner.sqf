params [ "_self","_newside"];

_self setvariable ["atlas_town_owner",_newside];

{
	[_x,_newside] call (_x getvariable "atlas_obj_setowner");
} foreach (_self getVariable "atlas_town_objectives");

[_self,false] call (_self getvariable "atlas_townf_draw");
