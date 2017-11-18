params ["_origin","_target","_amount"];

if(_origin getVariable ["atlas_respawn_bodiesRemaining",0] >= _amount) then 
{
	if((_target getVariable ["atlas_respawn_maxBodies",0] - _origin getVariable ["atlas_respawn_bodiesRemaining",0]) <= _amount) then
	{
		[_origin, -_amount, true] call atlas_fnc_adjustBodyCount;
		[_target, _amount, true] call atlas_fnc_adjustBodyCount;
		//["_target","_amount","_additive"]
	};
};