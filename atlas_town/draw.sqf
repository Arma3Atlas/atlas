 params ["_self"];

_newside = _self getvariable "atlas_town_owner";
_locname = _self getVariable "atlas_town_locname";

_locName setMarkerAlpha 0.5;

_color = switch (_newside) do {
    case west: { "ColorWest" };
    case east: { "ColorEast" };
	default { "ColorGUER" };
};
_locName setMarkerColor _color; 

// Objectives
{[_x] call (_x getVariable "atlas_objf_draw")} 
 foreach (_self getVariable "atlas_town_objectives");

