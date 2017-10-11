params ["_self"];

_markerstr = _self getvariable "atlas_obj_markerstr";
_newside = _self getvariable "atlas_obj_currentowner";
//test for enabled or not
_enabled = _self getvariable "atlas_obj_enable";


//debug - loki cheatsheet//
x_markerstr = _markerstr;
x_self = _self;
x_newside = _newside;
x_enabled = _enabled;


_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
    default { "ColorGUER" };
};

_markerstr setMarkerColor _color;


//if atlas_obj_enable is false then setMarkerAlpha
if (!_enabled) then {

	_self setvariable ["atlas_obj_enable",false];
	
	_markerstr setMarkerAlpha 0;
	
	//hint format ["atlas_obj_enable: %1",_enabled];
};


//hint format ["_markerstr: %1",_markerstr];

// location markers for the objectives
//do we want them? y/n
//https://community.bistudio.com/wiki/cfgMarkers
