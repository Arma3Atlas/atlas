//very basic trigged based, replace later if limited tickets added

params ["_activatingUnits"];


{
	_vehicle = _x;
	_maxBodies = _vehicle getVariable ["atlas_respawn_maxBodies",0];
	if(_vehicle getvariable ["atlas_respawn_bodiesRemaining",0] < _maxBodies) then
	{
		_vehicle setVariable ["atlas_respawn_bodiesRemaining",_maxBodies,true];
	};
} forEach _activatingUnits;