_vehicle = _this;
_classname = typeOf _vehicle;

assert (isClass (missionConfigFile >> "Atlas_Respawn_Vehicles" >> "Vehicles" >> _classname ));
_maxBodies = getNumber (missionConfigFile >> "Atlas_Respawn_Vehicles" >> "Vehicles" >> _classname >> "maxCapacity");

//_maxBodies = 15;
_cargoSeats = 15;

//_b = _this isTypeOf["B_Truck_01_covered_F","O_Truck_03_covered_F","I_Truck_02_covered_F"]

_vehicle setVariable ["atlas_respawn_bodiesRemaining",_maxBodies];




_vehicle setVariable ["atlas_respawn_maxBodies",_maxBodies];