_vehicle = this;
_callerSide = "WEST";




if(
    (_vehicle getvariable ["atlas_respawn_bodiesRemaining",0] > 0) && 
    (alive _vehicle) && 
    (_vehicle side == _callerSide) &&
    (speed _vehicle < 2)
    //vehicle location acceptable
    
    
    )