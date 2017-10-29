params ["_firsttown"];
if (!isnil "atlas_alltowns_townlist") exitwith {atlas_alltowns_townlist;};

assert (!isnil "_firsttown");
atlas_alltowns_townlist = [_firsttown];

for [{_i = 0}, {_i < count atlas_alltowns_townlist}, {_i=_i+1}] do {
	private _currenttown = atlas_alltowns_townlist select _i;
	[_currenttown] call (_currenttown getvariable "atlas_town_getneighbors")
	apply { atlas_alltowns_townlist pushBackUnique _x };
};

atlas_alltowns_townlist;
