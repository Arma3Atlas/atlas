params ["_self","_neighbors","_objectives","_initialowner"];

_self setvariable ["atlas_townp_owner",_initialowner];
_self setvariable ["atlas_townp_objectives",_objectives];
_self setvariable ["atlas_townp_neighbors",_neighbors];
_self setvariable ["atlas_townp_active", false];

_self setvariable ["atlas_town_draw", atlas_town_draw];
_self setvariable ["atlas_town_enable",atlas_town_enable];
_self setvariable ["atlas_town_objupdate", atlas_town_objupdate];
_self setvariable ["atlas_town_setowner",atlas_town_setowner];
_self setvariable ["atlas_town_neighborupdate",atlas_town_neighborupdate];

// Objectives
// Not dealing with multiple objective types yet
{ [_x,_self,_initialowner] call atlas_obj_bunker_new; }
foreach _objectives;


// Set up marker(s)
_nearLoc = nearestLocation [_self, ""];
_self setvariable ["atlas_townp_nearloc",_nearLoc];  // in case we need it
_locName = text _nearLoc;
_self setvariable ["atlas_townp_markername", _locName];
_markerstr = createMarker [_locName, position _nearLoc];
_markerstr setMarkerShape "RECTANGLE";
_markerstr setMarkerSize [400,400];
_markerstr setMarkerAlpha 0.5;
//_markerstr setMarkerType "hd_warning";
//_markerstr setMarkerText _locName;

[_self] call (_self getvariable "atlas_town_draw");
