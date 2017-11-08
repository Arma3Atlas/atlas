params ["_spawnTarget","_caller"];

if(typeName _spawnTarget == "SCALAR") then 
{
	if(_spawnTarget >= 0 && _spawnTarget < count atlas_respawn_spawnVehicleList) then
	{
	_spawnTarget = (atlas_respawn_spawnVehicleList select _spawnTarget);
	};
};
//At some point a serverside queue may be needed to avoid complications

if(!( [_spawnTarget,_caller] call Atlas_fnc_isRespawnable)) exitwith {hint "norespawn";};//should return message to gui
_caller moveInCargo _spawnTarget; //gonna need to run clientside. may need to change to moveInAny if we use somthing without a lot of cargo spaces
//check player moved successfully
[_spawnTarget] remoteExecCall ["Atlas_fnc_subtractBody", 2, false];


