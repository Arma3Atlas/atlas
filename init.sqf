
//needed in order to spawn on the fly.
createcenter WEST;
createcenter EAST;
createcenter RESISTANCE;
createcenter CIVILIAN;


// Just where this code goes in the "final product" is TBD
// a release would use compilefinal
atlas_obj_bunker_new = compile preprocessFileLineNumbers "atlas_bunker\newbunker.sqf";
atlas_obj_bunker_draw = compile preprocessFileLineNumbers "atlas_bunker\draw.sqf";
atlas_obj_bunker_enable = compile preprocessFileLineNumbers "atlas_bunker\enable.sqf";
atlas_obj_bunker_getowner = {(_this select 0) getvariable "atlas_objp_currentowner";};
atlas_obj_bunker_setowner = compile preprocessFileLineNumbers "atlas_bunker\setowner.sqf";
atlas_obj_bunkerp_update = compile preprocessFileLineNumbers "atlas_bunker\update.sqf";

// Town functions
atlas_town_new = compile preprocessFileLineNumbers "atlas_town\newtown.sqf";
atlas_town_draw = compile preprocessFileLineNumbers "atlas_town\draw.sqf";
atlas_town_objupdate = compile preprocessFileLineNumbers "atlas_town\objupdate.sqf";
atlas_town_setowner = compile preprocessFileLineNumbers "atlas_town\setowner.sqf";
atlas_town_neighborupdate = compile preprocessFileLineNumbers "atlas_town\neighborupdate.sqf";
atlas_town_enable = compile preprocessFileLineNumbers "atlas_town\enable.sqf";

[gravia, [telos], [gravia_bunker_1,gravia_bunker_2],resistance ] call atlas_town_new;
[gravia,true] call (gravia getvariable "atlas_town_enable");

[telos, [gravia,anthrakia,kalithea], [telos_bunker_1,telos_bunker_2],resistance ] call atlas_town_new;
[anthrakia, [telos], [anthrakia_bunker_1,anthrakia_bunker_2],resistance ] call atlas_town_new;
[kalithea, [telos], [kalithea_bunker_1,kalithea_bunker_2],resistance ] call atlas_town_new;



