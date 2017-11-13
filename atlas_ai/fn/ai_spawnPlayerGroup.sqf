
//count units in players group
if (count units group player > 5) exitWith {hint format ["%1: your squad is full",name player]};

//some arguments are optional, this is the bare minimum:
//_myGroup = [position, side, character details] call BIS_fnc_spawnGroup;

private _myGroup = "";

switch (side player) do {
case west: {_myGroup = [position player, west, 5] call BIS_fnc_spawnGroup;};
case east: {_myGroup = [position player, east, 5] call BIS_fnc_spawnGroup;};
default {};
};

(units _myGroup) join player;