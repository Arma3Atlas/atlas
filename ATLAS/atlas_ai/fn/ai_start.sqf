
hint "AI systems started";
if (!isserver) exitwith {};

//gravia getvariable "atlas_townp_active";
//atlas_ai_townlist_enabled = atlas_alltowns_townlist;
atlas_ai_townlist_enabled = [];

//ai spawn tests
//setting which towns are active to an array
{
	if (_x getvariable "atlas_townp_active") then {	
		atlas_ai_townlist_enabled pushback _x;
	};
} forEach atlas_alltowns_townlist;

//1st stage for guer ai
{[1,true,false,[50,100,150],_x,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";} forEach atlas_ai_townlist_enabled;

//2nd stage - wait to spawn guer ai when another town becomes active




