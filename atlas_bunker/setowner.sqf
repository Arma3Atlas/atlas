params ["_self","_newside"];

_self setvariable ["atlas_objp_currentowner",_newside,true];

[_self] call (_self getvariable "atlas_obj_draw");

