params ["_self"];

format ["atlas_ai_town_enable on %1",_self] call atlas_debugout;

if (_self getvariable ["atlas_aip_once",false]) exitwith {};
_self setvariable ["atlas_aip_once",true];

format ["atlas_ai_town_enable first on town %1",_self];

[1,true,false,[50,100,150],_self,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";

