params ["_vehicle","_caller"];



_callerSide = side _caller;

//"hint" hintC str [_fnc_scriptName,_fnc_scriptNameParent];



_isRespawnable = (
    (_vehicle getvariable ["atlas_respawn_bodiesRemaining",0] > 0) && 
    (alive _vehicle) && 
    (_vehicle != vehicle _caller) &&
    !(_callerSide isEqualTo "ENEMY") &&
    (_vehicle getvariable ["atlas_respawn_permSide","ENEMY"] isEqualTo _callerSide) &&
    (side _vehicle isEqualTo _callerSide || side _vehicle isEqualTo civilian) && 
    (speed _vehicle < 2)
    //vehicle location acceptable
    //empty cargo seat
    
    );
_isRespawnable