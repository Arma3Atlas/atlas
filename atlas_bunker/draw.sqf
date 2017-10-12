params ["_self"];

_markerstr = _self getvariable "atlas_obj_markerstr";
_newside = _self getvariable "atlas_obj_currentowner";

_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
    default { "ColorGUER" };
};

_markerstr setMarkerColor _color;

_enabled = _self getvariable "atlas_obj_enable";
if (!_enabled) then {
	_markerstr setMarkerAlpha 0;
} else {
	_markerstr setMarkerAlpha 0.75;
};

//test for active or not
_active = _self getvariable "atlas_obj_active";


//debug - loki cheatsheet//
x_markerstr = _markerstr;
x_self = _self;
x_newside = _newside;
x_enabled = _enabled;
x_active = _active;

//hint format ["atlas_obj_enable: %1",_enabled];
//hint format ["_markerstr: %1",_markerstr];

// location markers for the objectives
//do we want them? y/n
//https://community.bistudio.com/wiki/cfgMarkers
