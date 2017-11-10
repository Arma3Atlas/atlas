
hint "AI systems started";
if (!isserver) exitwith {};

//gravia getvariable "atlas_townp_active";

//ai spawn tests
//1st stage for guer ai
{
	if (_x getvariable "atlas_townp_active") then {	
		[1,true,false,[50,100,150],_x,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";
	};
} forEach atlas_alltowns_townlist;

//2nd stage - wait to spawn guer ai when town becomes active



