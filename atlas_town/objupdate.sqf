if (!isserver) exitwith {};
("town::objupdate " + str _this) call atlas_debugout;

params ["_self","_objective","_newside"];

(_self getvariable "atlas_townp_objectives") apply {
	private _objside = [_x] call (_x getvariable "atlas_obj_owner");
	if (_objside != _newside) then {
		_newside = civilian;
	};
};

if (_newside == civilian) exitwith {};

[_self,_newside] call (_self getvariable "atlas_town_setowner");
[_self,false] call (_self getvariable "atlas_town_draw");

(_self getvariable "atlas_townp_neighbors") apply {
	[_x,_self,_newside] call (_x getVariable "atlas_town_neighborupdate");
};

nil;
