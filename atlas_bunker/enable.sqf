if (!isserver) exitwith {};
params ["_self","_newstate"];

//todo check _newstate is boolean
_self setvariable ["atlas_objp_active",_newstate,true];
[_self] call (_self getvariable "atlas_obj_draw");

private _fnc = _self getvariable "atlas_townp_aicalls" select _activate;
format ["atlas_bunker_enable: %1 %2", _self, _newstate] call atlas_debugout;
[_self] call _fnc;



