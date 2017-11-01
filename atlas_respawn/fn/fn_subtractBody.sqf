params ["_target"];
_target setvariable ["atlas_respawn_bodiesRemaining",_target getvariable ["atlas_respawn_bodiesRemaining",0] - 1];
if(_target getvariable ["atlas_respawn_bodiesRemaining",0] < 0) then {"less than zero bodies remaining in vehicle" call atlas_debugout};