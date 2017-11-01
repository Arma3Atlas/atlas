
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
atlas_obj_bunkerp_updater = compile preprocessFileLineNumbers "atlas_bunker\updater.sqf";
atlas_obj_bunker_open_to = compile preprocessFileLineNumbers "atlas_bunker\open_to.sqf";
atlas_objp_bunker_progressbar = compile preprocessFileLineNumbers "atlas_bunker\progressbar.sqf";
atlas_objp_bunker_captureduration = 12;

// Town functions
atlas_town_new = compile preprocessFileLineNumbers "atlas_town\newtown.sqf";
atlas_town_draw = compile preprocessFileLineNumbers "atlas_town\draw.sqf";
atlas_town_objupdate = compile preprocessFileLineNumbers "atlas_town\objupdate.sqf";
atlas_town_setowner = compile preprocessFileLineNumbers "atlas_town\setowner.sqf";
atlas_town_neighborupdate = compile preprocessFileLineNumbers "atlas_town\neighborupdate.sqf";
atlas_town_enable = compile preprocessFileLineNumbers "atlas_town\enable.sqf";
atlas_town_perm_open_to = compile preprocessFileLineNumbers "atlas_town\perm_open_to.sqf";

atlas_util_uid = compile preprocessFileLineNumbers "atlas_util\uid.sqf";
atlas_util_drawtownlinks = compile preprocessFileLineNumbers "atlas_util\drawtownlinks.sqf";
atlas_debugout = compile preprocessfilelinenumbers "atlas_util\debugout.sqf";
atlas_debugout_enabled = true;
atlas_errorout = compile preprocessfilelinenumbers "atlas_util\errorout.sqf";
atlas_alltowns = compile preprocessFileLineNumbers "atlas_util\alltowns.sqf";


//testTowns
//west start
[gravia, [telos], [gravia_bunker_1,gravia_bunker_2],resistance ] call atlas_town_new;
[gravia,west] call (gravia getvariable "atlas_town_perm_open_to");
[gravia,true] call (gravia getvariable "atlas_town_enable");

//middle fight
[telos, [gravia,anthrakia,kalithea], [telos_bunker_1,telos_bunker_2],resistance ] call atlas_town_new;
[anthrakia, [telos,charkia], [anthrakia_bunker_1,anthrakia_bunker_2],resistance ] call atlas_town_new;
[kalithea, [telos,rodopoli], [kalithea_bunker_1,kalithea_bunker_2],resistance ] call atlas_town_new;
[charkia, [rodopoli,anthrakia], [charkia_bunker_1,charkia_bunker_2],resistance ] call atlas_town_new;
[rodopoli, [paros,charkia,kalithea], [rodopoli_bunker_1,rodopoli_bunker_2],resistance ] call atlas_town_new;

//east start
[paros, [rodopoli], [paros_bunker_1,paros_bunker_2],resistance ] call atlas_town_new;
[paros,east] call (gravia getvariable "atlas_town_perm_open_to");
[paros,true] call (paros getvariable "atlas_town_enable");

// All towns defined, now we can build any multitown stuff
[gravia] call atlas_alltowns;
call atlas_util_drawtownlinks;




