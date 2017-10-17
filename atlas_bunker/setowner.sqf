params ["_self","_newside"];

_self setvariable ["atlas_obj_currentowner",_newside];

[_self] call (_self getvariable "atlas_objf_draw");

