
hint "AI systems started";
if (!isserver) exitwith {};

//gravia getvariable "atlas_townp_active";
//_x getvariable "atlas_townp_owner";
//(_self getVariable "atlas_townp_objectives")


//debug - so i can see what is going on.. and maybe plug into

//atlas_ai_townlist_enabled = [[gravia,true,GUER,[gravia_bunker_1,gravia_bunker_2]],[paros,true,GUER,[paros_bunker_1,paros_bunker_2]]]

//atlas_ai_townlist_disabled = [[telos,false,GUER,[telos_bunker_1,telos_bunker_2]],[anthrakia,false,GUER,[anthrakia_bunker_1,anthrakia_bunker_2]],[kalithea,false,GUER,[kalithea_bunker_1,kalithea_bunker_2]],[charkia,false,GUER,[charkia_bunker_1,charkia_bunker_2]],[rodopoli,false,GUER,[rodopoli_bunker_1,rodopoli_bunker_2]]]

atlas_ai_townlist_enabled = [];
atlas_ai_townlist_disabled = [];

//ai spawn tests
//setting which towns are active/disabled to arrays
{
	if (_x getvariable "atlas_townp_active") then {	
		atlas_ai_townlist_enabled pushback [_x, _x getvariable "atlas_townp_active", _x getvariable "atlas_townp_owner", _x getVariable "atlas_townp_objectives"];
	} else {
		atlas_ai_townlist_disabled pushback [_x, _x getvariable "atlas_townp_active", _x getvariable "atlas_townp_owner", _x getVariable "atlas_townp_objectives"];
	};
} forEach atlas_alltowns_townlist;

//1st stage for guer ai
/*
{[1,true,false,[50,100,150],_x select 0,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";} forEach atlas_ai_townlist_enabled;
*/

//2nd stage - wait to spawn guer ai when another town becomes active




