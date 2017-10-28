params ["_self"];

if (isserver) then {
    [_self] remoteexeccall ["atlas_obj_bunker_draw",-2,false];
};

_markerstr = _self getvariable "atlas_objp_markerstr";
_newside = _self getvariable "atlas_objp_currentowner";

_opento = _self getvariable "atlas_objp_capturingsides";
if (!(side player in _opento)) exitwith {
    _markerstr setmarkeralpha 0;
    _markerstr setmarkercolor "colorYellow";
};


_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
    default { "ColorGUER" };
};

_markerstr setMarkerColor _color;

_enabled = _self getvariable "atlas_objp_active";
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

//hint format ["_markerstr: %1",_markerstr];

// location markers for the objectives
//do we want them? y/n
//https://community.bistudio.com/wiki/cfgMarkers
