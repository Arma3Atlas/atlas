params ["_target","_amount","_additive"];
_newValue = _amount;
if(_additive) then 
{
	_newValue = ((_target getvariable ["atlas_respawn_bodiesRemaining",0]) + _amount);
};

if(_newValue < 0)  												 then {"fewer than zero bodies remaining in vehicle" call atlas_debugout};
if(_newValue > _target getVariable["atlas_respawn_maxBodies",0]) then {"more bodies than possible in vehicle"		call atlas_debugout};



_target setvariable ["atlas_respawn_bodiesRemaining",_newValue,true];

