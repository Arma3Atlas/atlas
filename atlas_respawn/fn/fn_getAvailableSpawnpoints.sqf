params["_caller"];

_spawnList = [];

{
	_vehicle = missionnamespace getvariable _x;
	if([_vehicle,_caller] call Atlas_fnc_isRespawnable) then
	{
		_spawnList pushBack _vehicle;
	};
}   foreach atlas_respawn_spawnVehicleList;
_spawnList