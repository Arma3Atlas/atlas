params ["_self","_parent","_initialowner"];

// internal variables
_self setvariable ["atlas_obj_parent",_parent];
_self setvariable ["atlas_obj_active",false];
_self setvariable ["atlas_obj_currentowner",_initialowner];

// interface functions
_self setvariable ["atlas_obj_draw",atlas_obj_bunker_draw];
_self setvariable ["atlas_obj_enable",atlas_obj_bunker_enable];
_self setvariable ["atlas_obj_owner",atlas_obj_bunker_getowner];
_self setvariable ["atlas_obj_setowner",atlas_obj_bunker_setowner];

// Trigger
_trg = createTrigger ["EmptyDetector", getpos _self];
_trg setTriggerArea [5, 5, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", true];

_triggerglobalname = vehicleVarName _self + "_trigger";
missionnamespace setvariable [_triggerglobalname,_trg];
_updatecall = format ["[%1,%2] call atlas_obj_bunker_update", vehicleVarName _self, _triggerglobalname];
_trg setTriggerStatements ["this", _updatecall, _updatecall];

_self setvariable ["atlas_obj_trigger", _trg];

// TODO Create marker
//..
_markerstr = [format ["%1_%2", "marker", _self], _trg] call BIS_fnc_markerToTrigger;
_self setvariable ["atlas_obj_markerstr",_markerstr];

[_self] spawn atlas_obj_bunker_draw;



//test for enabled or not
_enabled = true;

//get/set new vars to _self
_parent = _self getvariable "atlas_obj_parent";
[_parent, _self, _enabled] call (_parent getvariable "atlas_town_objupdate");

_self setvariable ["atlas_obj_enable",true];


//debug - loki cheatsheet//
//_allVarsTrigger = allVariables _self;
//x_allVarsTrigger = _allVarsTrigger;
//hint format ["_self %1",_allVarsTrigger];
//hint format ["_markerstr: %1",_markerstr];











