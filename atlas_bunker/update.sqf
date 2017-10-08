
params ["_self","_trg"];

//debug
_trg2 = _self getvariable "atlas_obj_trigger";
if (_trg == _trg2) then { hint format ["%1  %2", _trg, _self]; };

// most simple way to test the core
_westCountZone = {side _x == west && alive _x} count list _trg;
_eastCountZone = {side _x == east && alive _x} count list _trg;
_guerCountZone = {side _x == resistance && alive _x} count list _trg;

//notes
//after deteriming some side has success.. need to set that side to the new owner. update a funtion on the _parent var. 
//(mkrs, score.. whatever in the future)

//actual code (TEST)
private ["_newside"];

_newside = "";

x_newside = _newside;

if (_westCountZone > _eastCountZone) then {_newside = west};
if (_eastCountZone > _westCountZone) then {_newside = east};

[_self, _newside] call (_self getvariable "atlas_obj_parent" getvariable "atlas_town_objupdate");

_self setvariable ["atlas_obj_owner", _newside];

//debug
hint format ["%1  %2", _newside, _self];


//marker update
[_self,_newside] spawn atlas_obj_mkrZone;




