
params ["_self"];
if (!isserver) exitwith {};

// If town is not capturable, disregard anything entering the trigger area
private _enabled = _self getvariable "atlas_objp_active";
if (!_enabled) exitwith {};
if (_self getVariable "atlas_objp_updater_running") exitwith {};
_self setVariable ["atlas_objp_updater_running",true];

[atlas_obj_bunkerp_updater,5,_self] call CBA_fnc_addPerFrameHandler;

[10] spawn atlas_proBar;