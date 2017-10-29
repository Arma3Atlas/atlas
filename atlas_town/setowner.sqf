if (!isserver) exitwith {};
params [ "_self","_newside"];

_self setvariable ["atlas_townp_owner",_newside,true];

(_self getVariable "atlas_townp_objectives") apply {
	[_x,_newside] call (_x getvariable "atlas_obj_setowner");
};

[_self,false] call (_self getvariable "atlas_town_draw");
