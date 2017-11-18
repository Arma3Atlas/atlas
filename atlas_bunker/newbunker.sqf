params ["_self","_parent","_initialowner"];

// internal variables
_self setvariable ["atlas_objp_parent",_parent];
if (isserver) then {
	_self setvariable ["atlas_objp_active",false,true];
	_self setvariable ["atlas_objp_currentowner",_initialowner,true];
	_self setvariable ["atlas_objp_capturingsides",[_initialowner],true];
	_self setvariable ["atlas_objp_capturer",civilian,true];
	_self setvariable ["atlas_objp_captureprogress",0,true];
	_self setvariable ["atlas_objp_bunker_aicalls",	// todo: public setter
		[atlas_obj_bunkerai_disable,atlas_obj_bunkerai_enable, atlas_obj_bunkerai_oncapture]
	];
};
// interface functions
_self setvariable ["atlas_obj_draw",atlas_obj_bunker_draw];
_self setvariable ["atlas_obj_enable",atlas_obj_bunker_enable];
_self setvariable ["atlas_obj_owner",atlas_obj_bunker_getowner];
_self setvariable ["atlas_obj_setowner",atlas_obj_bunker_setowner];
_self setvariable ["atlas_obj_open_to",atlas_obj_bunker_open_to];


//move bunker tests
_pos = (position _parent) findEmptyPosition [10,200,"Land_HBarrier_01_tower_green_F"];
x_pos = _pos;
//move the bunker
_self setPos _pos;

// Trigger
// todo: make server only - replace markertotrigger below
_trg = createTrigger ["EmptyDetector", getpos _self, false];
_trg setTriggerArea [5, 5, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", true];

if (isserver) then {
	// This sets up the entrypoint from which most function calls originate
	// todo: find a better way to pass _self than relying on vehicleVarName
	private _updatecall = format ["[%1] call atlas_obj_bunkerp_update", vehicleVarName _self];
	_trg setTriggerStatements ["this", _updatecall, ""];
};

_self setvariable ["atlas_objp_trigger", _trg];

// Marker
private _markername = format ["atlas_marker_%1",call atlas_util_uid];
private _markerstr = [_markername, _trg, true] call BIS_fnc_markerToTrigger;
_self setvariable ["atlas_objp_markerstr",_markerstr];

[_self] call (_self getVariable "atlas_obj_draw");  // = atlas_obj_bunker_draw

