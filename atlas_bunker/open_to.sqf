params ["_self","_sides"];
_self setvariable ["atlas_objp_capturingsides",_sides,true];

systemchat str _this;

// in case they are already inside
[_self] call atlas_obj_bunkerp_update;

