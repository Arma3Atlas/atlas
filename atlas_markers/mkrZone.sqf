

params ["_self","_newside"];


//location marker for zone
_nearLoc = nearestLocation [_self, ""];
_locName = name _nearLoc;

_markerstr = createMarker [_locName, position _nearLoc];
_markerstr setMarkerShape "RECTANGLE";
_markerstr setMarkerSize [400,400];
_locName setMarkerAlpha 0.5;

_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
	default { "ColorGUER" };
};
_locName setMarkerColor _color;

_self setvariable ["atlas_obj_markername", _locName];


// location markers for the objectives
//do we want them? y/n
//https://community.bistudio.com/wiki/cfgMarkers





