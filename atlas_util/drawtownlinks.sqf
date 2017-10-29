params ["_firsttown"];

private _towns = call atlas_alltowns;
assert (count _towns > 0);

// can use better for syntax that I can't remember 
for "_i" from 0 to (count _towns) - 1 do  {
	private _town_a = _towns select _i;
	[_town_a] call (_town_a getvariable "atlas_town_getneighbors")
	apply {
		private _town_b = _x;
		if (_towns find _town_b > _i) then {
		
		// draw marker from _town_a to _town_b
		_distanceTown_a_to_b = _town_a distance _town_b;
		_midPoint = (getPos _town_a vectoradd getPos _town_b) vectorMultiply 0.5;
	
		private _markername = format ["atlas_marker_%1",call atlas_util_uid];
		_markerstr = createMarker [_markername,[0,0]];
		_markerstr setMarkerShape "RECTANGLE";
		_markerstr setMarkerPos _midPoint;
		
		_dir = _town_a getDir _town_b;
		_markerstr setMarkerDir _dir;
		
		_markerlen = (_town_a distance2d _town_b) - 400;
		_markername setMarkerSize [20, _markerlen / 2];
			

		};
	};

};

