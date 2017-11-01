params ["_vehicle","_caller"];



_callerSide = side _caller;

//"hint" hintC str [_fnc_scriptName,_fnc_scriptNameParent];



_isRespawnable = (
    (_vehicle getvariable ["atlas_respawn_bodiesRemaining",0] > 0) && 
    (alive _vehicle) && 
    (side _vehicle == _callerSide) &&
    (speed _vehicle < 2)
    //vehicle location acceptable
    
    
    );
_isRespawnable