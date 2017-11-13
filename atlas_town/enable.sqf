if (!isserver) exitwith {};
params ["_self","_activate"];
assert (typename _activate == "BOOL");

_self setVariable ["atlas_townp_active",_activate,true];

(_self getVariable "atlas_townp_objectives") apply {
	[_x,_activate] call (_x getvariable "atlas_obj_enable");
};

[_self,false] call (_self getvariable "atlas_town_draw");

private _fnc = _self getvariable "atlas_townp_aicalls" select _activate;
format ["atlas_town_enable: "] call atlas_debugout;
[_self] call _fnc;

