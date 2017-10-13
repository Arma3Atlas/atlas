params [ "_self","_newside"];

_self setvariable ["atlas_town_owner",_newside];

{
	[_x,_newside] call (_x getvariable "atlas_objf_setowner");
} foreach (_self getVariable "atlas_town_objectives");


