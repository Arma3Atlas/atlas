
waitUntil {player == vehicle player};

//loki debug
//MP/SP
_uid = getPlayerUID player;

//unit markers *REMOVE ME -- NOT ATLAS's
if ((_uid isEqualTo "76561198080819113") || ((name player) isEqualTo "LOKI" )) then 
{
	["players","ais","allsides"] execVM "ATLAS\atlas_debug\player_markers.sqf";
	
};


//












