if (!isserver) exitwith {};
params ["_self","_sides"];

_self setvariable ["atlas_objp_capturingsides",_sides,true];

format ["bunker.opento: _self %1 _this %2",_self,_this]
call atlas_debugout;

// in case they are already inside
[_self] call atlas_obj_bunkerp_update;

