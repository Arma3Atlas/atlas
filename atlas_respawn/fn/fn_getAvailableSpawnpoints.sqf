params["_caller"];

_spawnList = [];

{
	if([_x,_caller] call Atlas_fnc_isRespawnable) then
	{
		_spawnList pushBack _x;
	};
}   foreach atlas_respawn_spawnVehicleList;
_spawnList