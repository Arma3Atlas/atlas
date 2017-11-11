if (!isserver) exitwith {};
params ["_self","_activate"];
assert (typename _activate == "BOOL");

_self setVariable ["atlas_townp_active",_activate,true];

(_self getVariable "atlas_townp_objectives") apply {
	[_x,_activate] call (_x getvariable "atlas_obj_enable");
};

[_self,false] call (_self getvariable "atlas_town_draw");

if (!_activate) exitwith {};
if (_self getvariable "atlas_townp_ai_once") exitwith {};
_self setvariable ["atlas_townp_ai_once",true];
{[1,true,false,[50,100,150],_x select 0,[100,150,200]] execVM "ATLAS\atlas_ai\fn\RandomSpawnTown.sqf";} forEach atlas_ai_townlist_enabled;

