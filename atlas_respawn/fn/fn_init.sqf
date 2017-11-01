if(!isserver) exitwith {};
atlas_respawn_spawnVehicleList = [];
atlas_respawn_spawnVehicleEH = null;
publicvariable "atlas_respawn_spawnVehicleList"; //If we are going to have more than 2 or 3 spawn vehicles this should be replaced with somthing more bandwidth friendly
[bob] call Atlas_fnc_initRespawnVehicle;
//sleep 10;
//[bob,player] call Atlas_fnc_isRespawnable;