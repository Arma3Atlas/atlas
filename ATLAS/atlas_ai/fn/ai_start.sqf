
hint "AI systems started";
if (!isserver) exitwith {};

//gravia getvariable "atlas_townp_active";
//atlas_ai_townlist_enabled = atlas_alltowns_townlist;
//_x getvariable "atlas_townp_owner";


//debug - so i can see what is going one.. and maybe plug into
//atlas_ai_townlist_enabled = [[gravia,true,GUER],[paros,true,GUER]]
//atlas_ai_townlist_disabled = [[telos,false,GUER],[anthrakia,false,GUER],[kalithea,false,GUER],[charkia,false,GUER],[rodopoli,false,GUER]]



atlas_ai_townlist_enabled = [];
atlas_ai_townlist_disabled = [];

//ai spawn tests
//setting which towns are active/disabled to arrays
{
	if (_x getvariable "atlas_townp_active") then {	
		atlas_ai_townlist_enabled pushback [_x, _x getvariable "atlas_townp_active", _x getvariable "atlas_townp_owner"];
	} else {
		atlas_ai_townlist_disabled pushback [_x, _x getvariable "atlas_townp_active", _x getvariable "atlas_townp_owner"];
	};
} forEach atlas_alltowns_townlist;

//1st stage for guer ai
{[1,true,false,[50,100,150],_x select 0,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";} forEach atlas_ai_townlist_enabled;

//2nd stage - wait to spawn guer ai when another town becomes active




