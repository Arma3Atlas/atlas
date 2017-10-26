params ["_firsttown"];

// First build the master town list
private _towns = [_firsttown];
for [{_i = 0}, {_i < count _towns}, {_i=_i+1}] do {
	private _currenttown = _towns select _i;
	private _neighb = [_currenttown] call (_currenttown getvariable "atlas_town_getneighbors");
	{ _towns pushBackUnique _x } foreach _neighb;
};

// can use better for syntax that I can't remember 
for [{_i = 0}, {_i < count _towns}, {_i=_i+1}] do {
	private _town_a = _towns select _i;
	private _neighb = [_town_a] call (_town_a getvariable "atlas_town_getneighbors");
	{
		private _town_b = _x;
		if (_towns find _town_b > _i) then {
			// draw marker from _town_a to _town_b






			

		};
	} foreach _neighb;

};

