params ["_self"];

_markerstr = _self getvariable "atlas_obj_markerstr";
_newside = _self getvariable "atlas_obj_currentowner";

_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
    default { "ColorGUER" };
};

_markerstr setMarkerColor _color;

_enabled = _self getvariable "atlas_obj_active";
if (!_enabled) then {
	_markerstr setMarkerAlpha 0;
} else {
	_markerstr setMarkerAlpha 0.75;
};

//debug - loki cheatsheet//
x_markerstr = _markerstr;
x_self = _self;
x_newside = _newside;
x_enabled = _enabled;
x_active = _active;

//hint format ["_markerstr: %1",_markerstr];

// location markers for the objectives
//do we want them? y/n
//https://community.bistudio.com/wiki/cfgMarkers
