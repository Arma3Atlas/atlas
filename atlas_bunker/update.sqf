
params ["_self","_trg"];

_enabled = _self getvariable "atlas_obj_active";
if (!_enabled) exitwith {};

//simple way to test the core
_westCountZone = {side _x == west && alive _x} count list _trg;
_eastCountZone = {side _x == east && alive _x} count list _trg;
_guerCountZone = {side _x == resistance && alive _x} count list _trg;

//notes
//after deteriming some side has success.. need to set that side to the new owner. update a funtion on the _parent var. 
//(mkrs, score.. whatever in the future)

//actual code (TEST)
private ["_newside"];

_newside = "";

if (_westCountZone > _eastCountZone + _guerCountZone) then {_newside = west};
if (_eastCountZone > _westCountZone + _guerCountZone) then {_newside = east};
if (_guerCountZone > _westCountZone + _eastCountZone) then {_newside = resistance};

if (_newside == "") exitwith {};

//get/set new vars to _self
_parent = _self getvariable "atlas_obj_parent";
[_parent, _self, _newside] call (_parent getvariable "atlas_town_objupdate");

_self setvariable ["atlas_obj_currentowner", _newside];


//test for enabled or not
if (side player == civilian) then {

_self setvariable ["atlas_obj_enable",false];


};


//debug
//hint format ["%1  %2", _newside, _markerstr];

//marker update
[_self] spawn atlas_obj_bunker_draw;
