
//needed in order to spawn on the fly.
createcenter WEST;
createcenter EAST;
createcenter RESISTANCE;
createcenter CIVILIAN;


// Just where this code goes in the "final product" is TBD
// a release would use compilefinal
atlas_obj_bunker_newbunker = compile preprocessfile "atlas_bunker\newbunker.sqf";
atlas_obj_bunker_draw = compile preprocessfile "atlas_bunker\draw.sqf";
atlas_obj_bunker_enable = compile preprocessfile "atlas_bunker\enable.sqf";
atlas_obj_bunker_owner = {(_this select 0) getvariable "atlas_obj_currentowner";};
atlas_obj_bunker_setowner = compile preprocessfile "atlas_bunker\setowner.sqf";
atlas_obj_bunker_update = compile preprocessfile "atlas_bunker\update.sqf";

//markers
//atlas_obj_mkrZone = compile preprocessfile "atlas_markers\mkrZone.sqf";


// town mock
town_objectiveupdate = {
	hint str _this;
};
//todo - correct object names
//[bunker,townlogic,guer] call atlas_obj_bunker_newbunker;

//gravia
[gravia_bunker_1,gravia,RESISTANCE] call atlas_obj_bunker_newbunker;
gravia setvariable ["atlas_town_objupdate",town_objectiveupdate];




