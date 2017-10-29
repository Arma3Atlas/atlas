params ["_self","_norecursive"];

if (isserver) then {
    [_self] remoteexeccall ["atlas_town_draw",-2,false];
};

private _newside = _self getvariable "atlas_townp_owner";
private _markername = _self getVariable "atlas_townp_markername";
private _opento = _self getvariable "atlas_townp_open_to";
if (!(side player in _opento)) exitwith {
    _markername setmarkeralpha 0.2;
    _markername setmarkercolor "colorYellow";
};

private _alpha = 0.2;
if (_self getVariable "atlas_townp_active") then {
    _alpha = 0.5;
};

_markername setMarkerAlpha _alpha;

_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
	default { "ColorGUER" };
};
_markername setMarkerColor _color; 

// Objectives
if (!isNil "_norecursive" && {_norecursive}) exitwith {};
(_self getVariable "atlas_townp_objectives") apply {[_x] call (_x getVariable "atlas_obj_draw")};

nil;
