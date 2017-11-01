params ["_spawnTarget","_caller"];
if(! _this call Atlas_fnc_isRespawnable) exitwith {};
_caller moveInCargo _spawnTarget; //gonna need to run clientside. may need to change to moveInAny if we use somthing without a lot of cargo spaces
//check player moved successfully
_spawnTarget remoteExecCall ["Atlas_fnc_subtractBody", 2, false];


