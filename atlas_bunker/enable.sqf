params ["_self","_newstate"];

//todo check _newstate is boolean
_self setvariable ["atlas_obj_active",_newstate];
[_self] call (_self getvariable "atlas_objf_draw");

