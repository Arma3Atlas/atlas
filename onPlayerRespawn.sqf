


waitUntil {player == vehicle player};

_unit = player;
removeAllActions _unit;

//unit markers *REMOVE ME -- NOT ATLAS's
_name = name player;
if (_name isEqualTo "LOKI") then 
{
	["players","ais","allsides"] execVM "atlas_debug\player_markers.sqf";

	//loadouts test
	[_name] spawn ATLAS_fnc_loadoutTest;
};

