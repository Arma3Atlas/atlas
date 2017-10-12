
params ["_self","_trg"];

_enabled = _self getvariable "atlas_obj_enable";
if (!_enabled) exitwith {};

//test for active or not
_self setvariable ["atlas_obj_active",true];

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

//throws an error -  Error Generic error in expression
//if (_newside == "") exitwith {};

//test for active on/off
if (count list _trg <= 0) then {_self setvariable ["atlas_obj_active",false];};

//get/set new vars to _self
_parent = _self getvariable "atlas_obj_parent";
[_parent, _self, _newside] call (_parent getvariable "atlas_town_objupdate");

_self setvariable ["atlas_obj_currentowner", _newside];


//test for enabled / active or not
if (side player == civilian) then {

_self setvariable ["atlas_obj_enable",false];

//test for active or not
_self setvariable ["atlas_obj_active",false];


};


//debug
//hint format ["%1  %2", _newside, _markerstr];

//marker update
[_self] spawn atlas_obj_bunker_draw;
