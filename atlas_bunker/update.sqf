
params ["_self","_trg"];

// If town is not capturable, disregard anything entering the trigger area
_enabled = _self getvariable "atlas_objp_active";
if (!_enabled) exitwith {};

_westCountZone = {side _x == west && alive _x} count list _trg;
_eastCountZone = {side _x == east && alive _x} count list _trg;
_guerCountZone = {side _x == resistance && alive _x} count list _trg;

//actual code (TEST)
private ["_newside"];
_newside = civilian;  // civ meaning "nobody outnumbers the rest"

if (_westCountZone > _eastCountZone + _guerCountZone) then {_newside = west};
if (_eastCountZone > _westCountZone + _guerCountZone) then {_newside = east};
if (_guerCountZone > _westCountZone + _eastCountZone) then {_newside = resistance};

if (_newside == civilian) exitwith {};

// This is where we'll start the longer capture process with timers, etc.
// Currently simplified for testing

_self setvariable ["atlas_objp_currentowner", _newside];

_parent = _self getvariable "atlas_objp_parent";
[_parent, _self, _newside] call (_parent getvariable "atlas_town_objupdate");

//marker update
[_self] call (_self getvariable "atlas_obj_draw");


