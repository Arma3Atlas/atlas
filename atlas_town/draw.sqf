 params ["_self","_norecursive"];

_newside = _self getvariable "atlas_town_owner";
_markername = _self getVariable "atlas_town_markername";

_markername setMarkerAlpha 0.5;

_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
	default { "ColorGUER" };
};
_markername setMarkerColor _color; 

// Objectives
if (!isNil "_norecursive" && {_norecursive}) exitwith {};
{[_x] call (_x getVariable "atlas_objf_draw")} 
 foreach (_self getVariable "atlas_town_objectives");

