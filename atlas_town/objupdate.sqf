if (!isserver) exitwith {};
hint ("town::objupdate " + str _this);

params ["_self","_objective","_newside"];

{
	private _objside = [_x] call (_x getvariable "atlas_obj_owner");
	if (_objside != _newside) then {
		_newside = civilian;
	};
} foreach (_self getvariable "atlas_townp_objectives");

if (_newside == civilian) exitwith {};

[_self,_newside] call (_self getvariable "atlas_town_setowner");
[_self,false] call (_self getvariable "atlas_town_draw");

{
	[_x,_self,_newside] call (_x getVariable "atlas_town_neighborupdate");
} foreach (_self getvariable "atlas_townp_neighbors");

