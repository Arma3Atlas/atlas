params ["_self","_neighbors","_objectives","_initialowner"];

_self setvariable ["atlas_town_owner",_initialowner];
_self setvariable ["atlas_town_objectives",_objectives];
_self setvariable ["atlas_town_neighbors",_neighbors];

_self setvariable ["atlas_townf_draw", atlas_town_draw];
_self setvariable ["atlas_townf_enable",atlas_town_enable];
_self setvariable ["atlas_townf_objupdate", atlas_town_objupdate];
_self setvariable ["atlas_townf_setowner",atlas_town_setowner];
_self setvariable ["atlas_townf_neighborupdate",atlas_town_neighborupdate];
// Objectives
// Not dealing with multiple objective types yet
{ [_x,_self,_initialowner] call atlas_obj_bunker_newbunker; }
foreach _objectives;


// Set up marker(s)
_nearLoc = nearestLocation [_self, ""];
_self setvariable ["atlas_town_nearloc",_nearLoc];  // in case we need it
_locName = name _nearLoc;
_self setvariable ["atlas_obj_markername", _locName];
_markerstr = createMarker [_locName, position _nearLoc];
_markerstr setMarkerShape "RECTANGLE";
_markerstr setMarkerSize [400,400];






