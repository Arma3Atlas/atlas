
//hint "AI systems started";
if (!isserver) exitwith {};

//junk code remove me
/*
atlas_ai_townlist_enabled = [];
atlas_ai_townlist_disabled = [];
atlas_ai_townlist_objOwner = [];

//ai spawn tests
//setting which towns are active/disabled to arrays
{
	_atlas_townp_active = _x getvariable "atlas_townp_active";
	_atlas_townp_owner = _x getvariable "atlas_townp_owner";
	_atlas_townp_objectives = _x getVariable "atlas_townp_objectives";
	//_atlas_objp_currentowner = {_x getvariable "atlas_objp_currentowner"} forEach _atlas_townp_objectives;
	//_atlas_townp_objectives pushback [_atlas_objp_currentowner, _atlas_objp_currentowner];
	
	if (_x getvariable "atlas_townp_active") then {	
		atlas_ai_townlist_enabled pushback [_x, _atlas_townp_active, _atlas_townp_owner, _atlas_townp_objectives];
	} else {
		atlas_ai_townlist_disabled pushback [_x, _atlas_townp_active, _atlas_townp_owner, _atlas_townp_objectives];
	};
} forEach atlas_alltowns_townlist;

//1st stage for guer ai
/*
{[1,true,false,[50,100,150],_x select 0,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";} forEach atlas_ai_townlist_enabled;
*/

//2nd stage - wait to spawn guer ai when another town becomes active




