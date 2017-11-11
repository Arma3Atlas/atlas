params ["_self"];

if (_self getvariable ["atlas_aip_once",false]) exitwith {};
_self setvariable ["atlas_aip_once",true];
[1,true,false,[50,100,150],_self,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";

