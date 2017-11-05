params ["_firsttown","_condition"];

private _list = [];
private _pending = [_firsttown];

while {count _pending > 0} do {
	private _town = _pending deleteat 0;
	if (_town in _list) then {}
	else {
		if (_town call _condition) then {
			_list pushback _town;
			_pending append ([_town] call (_town getvariable "atlas_town_getneighbors"));
		};
	};
};

_list;


