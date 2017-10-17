hint ("town::objupdate " + str _this);

params ["_self","_objective","_newside"];

{
	private _objside = [_x] call (_x getvariable "atlas_objf_getowner");
	if (_objside != _newside) then {
		_newside = civilian;
	};
} foreach (_self getvariable "atlas_town_objectives");

if (_newside == civilian) exitwith {};

[_self,_newside] call (_self getvariable "atlas_townf_setowner");
[_self,false] call (_self getvariable "atlas_townf_draw");
