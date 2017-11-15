if (!isserver) exitwith {};
params ["_self","_newside"];

_self setvariable ["atlas_objp_currentowner",_newside,true];
[_self] call (_self getvariable "atlas_objp_bunker_aicalls" select 2);

[_self] call (_self getvariable "atlas_obj_draw");

