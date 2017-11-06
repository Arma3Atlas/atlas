
private _towns = call atlas_alltowns;
private _count = count _towns;

private _west = 0;
private _east = 0;
private _resistance = 0;


_towns apply {
	[_x] call (_x getVariable "atlas_town_getowner");
} apply {
	switch (_x) do {
		case west: {_west = _west + 1;};
		case east: {_east = _east + 1;};
		case independent : {_resistance = _resistance + 1;};
		default { 
			private _msg = format ["atlas_util_ownsall: unknown side %1",_x];
			_msg call atlas_debugout;
		};
	};
};

if (_west == _count) exitwith {west};
if (_east == _count) exitwith {east};
if (_resistance == _count) exitwith {resistance};

sideUnknown;
